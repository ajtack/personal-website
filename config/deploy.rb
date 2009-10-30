set :application, 'cshome'
set :user, 'minusuu'
set :domain, 'cshome.minusuu.com'
set :deploy_to, '/home/minusuu/sites/cshome'
set :server_hostname, 'minusuu.com'

set :scm, 'git'
set :repository, 'git://github.com/ajtack/personal-website.git'

ssh_options[:forward_agent] = true
set :branch, 'master'
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/home/#{user}/sites/#{application}"

role :app, server_hostname
role :web, server_hostname
role :db,  server_hostname, :primary => true

namespace :passenger do
  desc "Restart Application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart do
    find_and_execute_task('passenger:restart')
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with Passenger."
    task t, :roles => :app do ; end
  end
end

after 'deploy', 'deploy:cleanup'
