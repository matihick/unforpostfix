require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rbenv"
require 'capistrano/rails'

require 'capistrano/capistrano_plugin_template'
require 'capistrano/unformatt/all'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
