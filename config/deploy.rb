# capistrano version
lock "3.8.0"

# setup
set :setup_nginx, true
set :setup_yamls, [:database, :secrets, :cable, :settings]
set :setup_daemons, [
  { name: :unicorn, config: true}
]
set :erase_deploy_folder_on_uninstall, true

set :application, "postfixman"
set :keep_releases, 5
set :deploy_to, "/home/maintainer/#{fetch(:application)}"

fetch(:setup_yamls, []).each do |yaml|
  append :linked_files, "config/#{yaml}.yml"
end

append :linked_dirs, "log", "tmp", "solr"

# scm
set :repo_url, "git@github.com:unformattmh/postfixman-backend.git"
set :branch, :master

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, "2.2.5"

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
set :app_server_port, 3000

# nginx
set :nginx_path, '/etc/nginx'
set :nginx_server_names, 'mail.domain.com'
set :nginx_read_timeout, '60'
set :nginx_use_ssl, true
set :nginx_ssl_private_key, '/path/to/private.key'
set :nginx_ssl_certificate, '/path/to/certificate.crt'
