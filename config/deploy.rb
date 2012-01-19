require 'bundler/capistrano'
set :application, "mi6.rossfoley.com"
role :app, application
role :web, application
role :db,  application, :primary => true

set :user, "ross"
set :deploy_to, "/var/apps/mi6"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git://github.com/rossfoley/MI6Stats.git"
set :branch, "master"

namespace :deploy do
  desc "Tell Passenger to restart."
  task :restart, :roles => :web do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  desc "Do nothing on startup so we don't get a script/spin error."
  task :start do
    puts "You may need to restart Apache."
  end

  desc "Symlink extra configs and folders."
  task :symlink_extras do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    # run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end

  desc "Setup shared directory."
  task :setup_shared do
    # run "mkdir #{shared_path}/assets"
    run "mkdir #{shared_path}/config"
    # run "mkdir #{shared_path}/db"
    puts "Now edit the config files and fill assets folder in #{shared_path}."
  end

  desc "Make sure there is something to deploy"
  task :check_revision, :roles => :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  desc "Compile assets for Rails 3.1"
  task :compile_assets do
    run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
  end
end

before "deploy", "deploy:check_revision"
after "deploy", "deploy:cleanup" # keeps only last 5 releases
after "deploy:setup", "deploy:setup_shared"
after "deploy:update_code", "deploy:symlink_extras"

# after "deploy:update_code", "deploy:compile_assets"
