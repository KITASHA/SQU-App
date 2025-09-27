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

namespace :unicorn do
  task :start do
    on roles(:app) do
      execute :rm, "-f #{shared_path}/tmp/pids/unicorn.pid #{shared_path}/sockets/unicorn.sock"
      within current_path do
        execute :bundle, "exec unicorn -c #{current_path}/config/unicorn.rb -E #{fetch(:rails_env)} -D"
      end
    end
  end

  task :stop do
    on roles(:app) do
      pid_file = "#{shared_path}/tmp/pids/unicorn.pid"
      execute :kill, "-QUIT $(cat #{pid_file}) || true" if test("[ -f #{pid_file} ]")
    end
  end

  task :restart do
    on roles(:app) do
      invoke "unicorn:stop"
      invoke "unicorn:start"
    end
  end
end

after 'deploy:publishing', 'unicorn:restart'

# Railsアセットプリコンパイルを有効
set :assets_roles, [:web, :app]
set :rails_env, 'production'
