namespace :deploy do
  namespace :unicorn do
    desc "Setups unicorn"
    task :setup, roles: :app do
      run "mkdir -p #{shared_path}/config"

      put_template "#{templates_path}/unicorn/unicorn.rb.erb", "#{shared_path}/config/unicorn.rb"
    end

    desc "Reloads unicorn"
    task :reload, roles: :app do
      run "#{daemons_path}/#{application}-unicorn reload"
    end
  end

  after "deploy:setup", "deploy:unicorn:setup"
end
