threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

pidfile "tmp/pids/server.pid"
stdout_redirect "log/puma.stdout.log", "log/puma.stderr.log", true
