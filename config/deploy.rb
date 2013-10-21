set :user, 'maintainer'

set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :default_environment, {
  "PATH" => "/home/#{user}/.rbenv/shims:/home/#{user}/.rbenv/bin:$PATH"
}

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

set :scm, :git
set :repository, 'git@github.com:unformattmh/postfixman.git'
set :branch, :master

set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :keep_releases, 3

set :application, 'postfixman'
set :deploy_to, "/home/#{user}/postfixman"

# stages of deployment
set :stages, %w(lhconfort segurocomar unformatt triplemsales)
set :default_stage, 'unformatt'
# path to configuration templates
set :templates_path, "config/cap/templates"
# list of ymls used
set :ymls, [:database, :settings]
# list of daemons used
set :daemons, [:unicorn]

set :daemons_path, '/etc/init.d'
set :monit_scripts_path, '/etc/monit/conf.d'

set :nginx_path, '/etc/nginx'
set :nginx_read_timeout, '60'
set :nginx_use_ssl, false
# ssl certificate paths (uncomment if you use ssl)
set :nginx_ssl_private_key, '/etc/ssl/private/star_seguro_com_ar.key'
set :nginx_ssl_certificate, '/etc/ssl/certs/star_seguro_com_ar_chained.crt'

# app servers data
set :app_servers, {
  lhconfort: { host: '127.0.0.1', port: '3000' },
  segurocomar: { host: '127.0.0.1', port: '3030' },
  triplemsales: { host: '127.0.0.1', port: '3030' },
  unformatt: { host: '127.0.0.1', port: '3000' }
}
