set :application, "test_app"

# = SCM
set :scm, 'git'
set :branch, "master"
set :git_enable_submodules, 1
set :repository,  "git://github.com/karmi/pushr_test_app.git"
set :deploy_via, :remote_cache

# = SSH
set :deploy_to, "/home/karmi/playground/pushr_test/#{application}"
set :user, "karmi"
set :runner, "karmi"
set :use_sudo, false

# = IPs & Paths
role :app, "karmi.cz"
role :web, "karmi.cz"
role :db,  "karmi.cz", :primary => true

# = Hooks
task :after_update_code, :roles => [:app, :db] do
  # link shared files
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{shared_path}/production.sqlite3 #{release_path}/db/production.sqlite3"
end
