require "bundler/capistrano"

set :application, "alumni_portal"
set :repository, "git@github.com:rgan/alumni_portal.git"
set :scm, "git"
set :deploy_to, "/var/apps"

server "localhost", :app, :web, :db, :primary => true

#namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
#end