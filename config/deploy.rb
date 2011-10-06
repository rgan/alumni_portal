require "bundler/capistrano"

set :application, "alumni_portal"
set :repository, "git@github.com:rgan/alumni_portal.git"
set :scm, "git"
set :deploy_to, "/var/apps"

task :staging do
  role :web, "localhost"
end

task :setup_prod_user_keys do
  set :user, "root"
  # scp -i ~/my-ec2-keypair ~/.ssh/id_rsa.pub root@xxx.amazonaws.com:/root/.ssh/authorized_keys2
  ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
  role :web, "ec2-174-129-87-0.compute-1.amazonaws.com"
end

task :production do
  :setup_prod_user_keys
end

# sets up everything for ubuntu; except Java: apt-get install sun-java6-jdk
task :setup_vm do
  setup_prod_user_keys
  run "sudo apt-get libcurl4-openssl-dev install git-core"
  run "sudo apache2 apache2-mpm-prefork apache2-prefork-dev"
  run "gem install passenger --no-ri --no-rdoc"
  run "gem install bundler --no-ri --no-rdoc"
  install_ruby_from_src
  install_mongodb
end



#namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
#end