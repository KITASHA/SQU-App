# スレッド数
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# 環境
environment ENV.fetch("RAILS_ENV") { "production" }

# workers / preload_app! を有効化（本番用）
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!

# shared ディレクトリの絶対パスを指定
shared_dir = "/var/www/SQU-App/shared"

# ソケット
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# PID / state / log
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# ワーカー起動時の処理
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# tmp_restart プラグイン
plugin :tmp_restart
