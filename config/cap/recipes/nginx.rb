namespace :deploy do
  namespace :nginx do
    desc "Setups nginx"
    task :setup, roles: :web do
      run "mkdir -p #{shared_path}/config"

      put_template "#{templates_path}/nginx/nginx.conf.erb", "#{shared_path}/config/#{application}.nginx"
      run "sudo cp #{shared_path}/config/#{application}.nginx #{nginx_path}/sites-available/#{application}"
      run "rm #{shared_path}/config/#{application}.nginx"
    end

    desc "Enables site"
    task :enable, roles: :web do
      run "sudo ln -snf #{nginx_path}/sites-available/#{application} #{nginx_path}/sites-enabled/#{application}"
    end

    desc "Disables site"
    task :disable, roles: :web do
      run "sudo rm #{nginx_path}/sites-enabled/#{application}"
    end

    desc "Reloads nginx service"
    task :reload, roles: :web do
      run "sudo #{daemons_path}/nginx reload"
    end

    desc "Starts nginx"
    task :start, roles: :web do
      run "sudo #{daemons_path}/nginx start"
    end

    desc "Stops nginx"
    task :stop, roles: :web do
      run "sudo #{daemons_path}/nginx stop"
    end

    desc "Restarts nginx"
    task :restart, roles: :web do
      run "sudo #{daemons_path}/nginx restart"
    end
  end

  after "deploy:setup", "deploy:nginx:setup"

  after "deploy:nginx:setup", "deploy:nginx:enable"

  after "deploy:nginx:enable", "deploy:nginx:reload"

  after "deploy:nginx:disable", "deploy:nginx:reload"
end
