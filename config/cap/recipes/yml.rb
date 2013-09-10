namespace :deploy do
  fetch(:ymls).each do |cfg|
    namespace "#{cfg.to_s}_yml" do
      desc "Creates #{cfg}.yml in shared path"
      task :setup do
        run "mkdir -p #{shared_path}/config"
        put_template "#{templates_path}/yamls/#{cfg}.yml.erb", "#{shared_path}/config/#{cfg}.yml"
      end

      desc "Updates the symlink for #{cfg}.yml file to the just deployed release"
      task :symlink do
        run "ln -snf #{shared_path}/config/#{cfg}.yml #{release_path}/config/#{cfg}.yml"
      end
    end

    after "deploy:setup", "deploy:#{cfg}_yml:setup"
    after "deploy:finalize_update", "deploy:#{cfg}_yml:symlink"
  end
end
