set :application, 'cshome'
set :user 'minusuu'
set :domain 'minusuu.com'
set :deploy_to, '/home/minusuu/rails/cshome'
set :server_hostname, 'cshome.minusuu.com'

set :scm, 'git'
set :repository,  'git://github.com/ajtack/personal-website.git'

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

set :repository,  "#{user}@#{domain}:/home/#{user}/git/#{application}"
set :scm_username, user
set :runner, user
set :use_sudo, false
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :deploy_to, "/home/#{user}/apps/#{application}"
default_run_options[:pty] = true
