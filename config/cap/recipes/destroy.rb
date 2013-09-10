namespace :deploy do
  desc "Destroys entire application (leaves no traces)"
  task :destroy do
    run "rm -rf #{deploy_to}"
    run "sudo rm -rf #{monit_scripts_path}/#{application}-*"
    run "sudo rm -rf #{daemons_path}/#{application}-*"
    run "sudo rm -f #{nginx_path}/sites-available/#{application}"
    run "sudo rm -f #{nginx_path}/sites-enabled/#{application}"
  end

  before "deploy:destroy", "deploy:monit:stop"

  after "deploy:destroy", "deploy:nginx:reload"

  after "deploy:destroy", "deploy:monit:reload"
end
