require 'bundler/capistrano' #Using bundler with Capistrano
set :stages, %w(staging production)

set :application, "ticketee"
set :domain, "176.34.61.11"
set :repository, "git://github.com/miau715/ticketee.git"
set :deploy_to, "/home/ticketeeapp.com/apps/#{application}"
role :app, domain
role :web, domain
role :db, domain, :primary => true
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :user, "ticketeeapp.com"
set :normalize_asset_timestamps, false
default_environment["PATH"] = "/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
namespace :deploy do
desc "restart"
task :restart do
run "touch #{current_path}/tmp/restart.txt"
end
end
desc "Create database.yml and asset packages for production"
task :copy_config_files, :roles => [:app] do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end


after "deploy:update_code", "deploy:copy_config_files"

