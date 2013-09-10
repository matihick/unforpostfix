namespace :deploy do
  fetch(:daemons).each do |cfg|
    namespace :monit do
      namespace "#{cfg.to_s}" do
        desc "Setups monit for #{cfg}"
        task :setup, roles: :app do
          run "mkdir -p #{shared_path}/config"

          set :service, cfg

          if File.exists? "#{templates_path}/monit/#{cfg}.erb"
            monit_template = "#{templates_path}/monit/#{cfg}.erb"
          else
            monit_template = "#{templates_path}/monit/global.erb"
          end

          put_template monit_template, "#{shared_path}/config/#{cfg}.monit"
          run "sudo cp #{shared_path}/config/#{cfg}.monit #{monit_scripts_path}/#{application}-#{cfg}"
          run "rm #{shared_path}/config/#{cfg}.monit"

          put_template "#{templates_path}/daemons/#{cfg}.erb", "#{shared_path}/config/#{cfg}.sh"
          run "chmod +x #{shared_path}/config/#{cfg}.sh"
          run "sudo cp #{shared_path}/config/#{cfg}.sh #{daemons_path}/#{application}-#{cfg}"
          run "rm #{shared_path}/config/#{cfg}.sh"
          run "touch #{shared_path}/pids/#{cfg}.pid"
        end
      end
    end

    after "deploy:setup", "deploy:monit:#{cfg}:setup"
  end

  namespace :monit do
    desc "Reloads monit service"
    task :reload, roles: :app do
      run "sudo monit reload"
    end

    desc "Starts application"
    task :start, roles: :app do
      run "sudo monit -g #{application} start all"
    end

    desc "Stops application"
    task :stop, roles: :app do
      run "sudo monit -g #{application} stop all"
    end

    desc "Restarts application"
    task :restart, roles: :app do
      run "sudo monit -g #{application} restart all"
    end

    desc "Starts monitoring application"
    task :monitor, roles: :app do
      run "sudo monit -g #{application} monitor all"
    end

    desc "Stops monitoring application"
    task :unmonitor, roles: :app do
      run "sudo monit -g #{application} unmonitor all"
    end
  end

  after "deploy:setup", "deploy:monit:reload"

  after "deploy:restart", "deploy:monit:restart"
end
