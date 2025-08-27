# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.19.1'

# Capistranoのログの表示に利用する
set :application, 'SQU-App'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url, 'git@github.com:KITASHA/SQU-App.git'
set :branch, 'main'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '3.2.0'

# どの公開鍵を利用してデプロイするか
set :ssh_options, {
  auth_methods: ['publickey'],
  keys: ['~/.ssh/LightsailDefaultKey-ap-northeast-1.pem']
}

# デプロイ後に Puma を systemd 経由で再起動
namespace :deploy do
  desc 'Restart Puma via systemd'
  task :restart do
    on roles(:app) do
      # systemd ユニット名に合わせてください
      execute :sudo, :systemctl, 'restart SQU-App.service'
    end
  end

  # デプロイ後に restart タスクを自動で呼ぶ
  after :publishing, :restart
end

namespace :deploy do
  task :migrate do
    on roles(:app) do
      execute "cd #{release_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec rails db:migrate"
    end
  end
end
