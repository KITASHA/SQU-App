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
set :default_env, {
  'SECRET_KEY_BASE' => File.read("#{shared_path}/.env").match(/SECRET_KEY_BASE=(.+)/)[1].strip,
  'RAILS_ENV' => 'production'
}


# Puma 再起動
namespace :deploy do
  desc 'Restart Puma via systemd'
  task :restart do
    on roles(:app) do
      execute :sudo, :systemctl, 'restart SQU-App.service'
    end
  end

  after :publishing, :restart

  task :migrate do
    on roles(:app) do
      execute "cd #{release_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec rails db:migrate"
    end
  end
end

