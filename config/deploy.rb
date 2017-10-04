# capistrano version
lock "3.9.1"

# setup
set :setup_nginx, true
set :setup_yamls, [:database, :secrets, :cable, :settings]
set :setup_daemons, [
  { name: :unicorn, config: true}
]
set :erase_deploy_folder_on_uninstall, true

set :application, "unforpostfix"
set :keep_releases, 5
set :deploy_to, "/home/maintainer/#{fetch(:application)}"

fetch(:setup_yamls, []).each do |yaml|
  append :linked_files, "config/#{yaml}.yml"
end

append :linked_dirs, "log", "tmp", "solr/default/data"

# scm
set :repo_url, "git@github.com:lhconfort/unforpostfix.git"
set :branch, :master

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, "2.3.5"

# rails
set :rails_env, :production
set :migration_role, :app
set :conditionally_migrate, true
set :assets_roles, :web
set :keep_assets, 2

# monit
set :monit_scripts_path, "/etc/monit/conf.d"
set :monit_user, 'maintainer'
set :monit_group, 'maintainer'

# daemons
set :daemons_path, "/etc/init.d"

# app_server
set :app_server_host, '127.0.0.1'
set :app_server_port, 3150

# nginx
set :nginx_path, '/etc/nginx'
set :nginx_protocols, [:http, :https]
set :nginx_use_ssl, true
