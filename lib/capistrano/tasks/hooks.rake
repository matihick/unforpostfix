# monit
after "deploy:install", "deploy:monit:reload"
after "deploy:uninstall", "deploy:monit:reload"

# nginx
after "deploy:install", "deploy:nginx:reload"
after "deploy:uninstall", "deploy:nginx:reload"

# unicorn
after "deploy:install", "deploy:unicorn:reload"
after "deploy:finished", "deploy:unicorn:restart"

# sidekiq
# before "deploy:starting", "deploy:sidekiq:reject_new_jobs"
# after "deploy:finished", "deploy:sidekiq:restart"
# after "deploy:install", "deploy:sidekiq:restart"
