# Capistrano のバージョン固定
lock '3.19.1'

# アプリ情報
set :application, 'SQU-App'
set :repo_url, 'git@github.com:KITASHA/SQU-App.git'
set :branch, 'main'

# 共通ディレクトリ（リリースごとに消えない）
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
  'vendor/bundle', 'public/system', 'public/uploads'
)

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '3.2.0'
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma unicorn sidekiq}
set :rbenv_custom_path, '/home/ubuntu/.rbenv'

# bundle 設定
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')

# SSH 設定
set :ssh_options, {
  auth_methods: ['publickey'],
  keys: ['~/.ssh/LightsailDefaultKey-ap-northeast-1.pem']
}

# linked_files に .env を追加
set :linked_files, fetch(:linked_files, []).push('.env')

# shared/.env を読み込んで environment に渡す
set :default_env, -> {
  env_hash = {}
  on roles(:app) do
    result = capture("cat #{shared_path}/.env || true")
    result.lines.each do |line|
      next if line.strip.empty? || line.start_with?('#')
      key, value = line.strip.split('=', 2)
      env_hash[key] = value if key && value
    end
  end
  env_hash.merge({
    'PATH' => "/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:$PATH",
    'NODE_ENV' => 'production'
  })
}

# Unicorn 設定
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_config_path, "#{current_path}/config/unicorn.rb"

namespace :deploy do
  # 古い assets を削除
  task :clear_assets do
    on roles(:web) do
      within release_path do
        execute :rm, '-rf', 'public/assets'
      end
    end
  end

  # プリコンパイル用の空ディレクトリを作成
  task :prepare_assets_dirs do
    on roles(:app) do
      execute :mkdir, '-p', "#{release_path}/app/assets/javascripts"
      execute :touch, "#{release_path}/app/assets/javascripts/.keep"
      execute :mkdir, '-p', "#{release_path}/app/assets/images"
      execute :touch, "#{release_path}/app/assets/images/.keep"
    end
  end

  before 'deploy:assets:precompile', 'deploy:clear_assets'
  before 'deploy:assets:precompile', 'deploy:prepare_assets_dirs'

  # DB マイグレーション
  desc 'Run database migrations'
  task :migrate do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rails db:migrate"
        end
      end
    end
  end
end

namespace :unicorn do
  pid_file = "#{shared_path}/tmp/pids/unicorn.pid"

  task :start do
    on roles(:app) do
      within current_path do
        execute :bundle, "exec unicorn -c config/unicorn.rb -E production -D"
      end
    end
  end

  task :stop do
    on roles(:app) do
      if test("[ -f #{pid_file} ]")
        pid_alive = test("kill -0 $(cat #{pid_file}) > /dev/null 2>&1")
        execute :kill, "-QUIT $(cat #{pid_file})", raise_on_non_zero_exit: false if pid_alive
        execute :rm, "-f #{pid_file}" unless pid_alive
      end
    end
  end

  task :restart do
    on roles(:app) do
      invoke 'unicorn:stop'
      invoke 'unicorn:start'
    end
  end
end

# Railsアセットプリコンパイルを有効
set :assets_roles, [:web, :app]
set :rails_env, 'production'

# デプロイ後に Unicorn を再起動
after 'deploy:publishing', 'unicorn:restart'
