namespace :deploy do
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

  desc 'Restart Puma'
  task :restart_puma do
    on roles(:app) do
      within current_path do
        state_file = "#{shared_path}/tmp/pids/puma.state"
        puma_config = "#{shared_path}/puma.rb"

        if test("[ -f #{state_file} ]")
          execute :bundle, "exec pumactl -S #{state_file} restart"
        else
          execute :bundle, "exec pumactl -C #{puma_config} start"
        end
      end
    end
  end

  after :publishing, :restart_puma
  after :finishing, 'deploy:cleanup'
end
