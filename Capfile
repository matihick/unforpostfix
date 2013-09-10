load 'deploy'
load 'config/deploy'
load 'config/cap/helpers'

Dir.glob("#{Dir.pwd}/config/cap/recipes/*").each do |recipe_file|
  load recipe_file
end

load 'deploy/assets'

require 'bundler/capistrano'
require 'capistrano/ext/multistage'
