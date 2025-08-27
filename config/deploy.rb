# capistranoのバージョン固定
lock '3.19.1'

# アプリ情報
set :application, 'SQU-App'
set :repo_url, 'git@github.com:KITASHA/SQU-App.git'
set :branch, 'main'

# 共通ディレクトリ
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 
  'vendor/bundle', 'public/system', 'public/uploads'
)

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '3.2.0'

# SSH
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
    # サーバー上の shared/.env を読む
    result = capture("cat #{shared_path}/.env")
    result.lines.each do |line|
      next if line.strip.empty? || line.start_with?('#')
      key, value = line.strip.split('=', 2)
      env_hash[key] = value if key && value
    end
  end
  env_hash
}


# Puma 再起動
namespace :deploy do
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

