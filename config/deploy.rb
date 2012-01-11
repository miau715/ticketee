require 'capistrano/ext/multistage'
require 'bundler/capistrano'
load 'deploy/assets'

set :stages, %w(staging production) 
set :default_stage, "production"

set :application, "ticketee"
set :repository, "git://github.com/miau715/ticketee.git"
set :deploy_to, "/home/ticketeeapp.com/apps/#{application}"

set :scm, :git
set :branch, "master"
set :user, "ticketeeapp.com"
set :scm_verbose, true
set :use_sudo, false
set :keep_releases, 5
set :deploy_via, :remote_cache 
set :deploy_env, "production" 
set :rails_env, "production"
set :normalize_asset_timestamps, false
set :user, "apps" 
set :group, "apps"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "176.34.61.11"                          # Your HTTP server, Apache/etc
role :app, "176.34.61.11"                          # This may be the same as your `Web` server
role :db,  "176.34.61.11", :primary => true # This is where Rails migrations will run
set :default_environment, {
  'PATH' => "/opt/ruby/bin/:$PATH"
}
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

desc "Create database.yml and asset packages for production"
after("deploy:update_code") do
  db_config = "#{shared_path}/config/database.yml.production"
  run "cp #{db_config} #{release_path}/config/database.yml"
end