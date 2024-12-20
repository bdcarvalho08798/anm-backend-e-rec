# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

# set :user, 'anm'
set :user, 'fuas'


set :application, "e-recruitment-anm"
set :repo_url, 'git@github.com:bdcarvalho08798/anm-rec-test.git'
set :branch, 'master'

# Default deploy_to directory
# set :deploy_to, "/home/anm/anmrecruitmentportal/#{fetch(:application)}"
set :deploy_to, "/home/fuas/recruitment-portal/#{fetch(:application)}"

# Use npm to install dependencies and build the app
set :npm_flags, '--production --silent'
set :npm_roles, :web
set :npm_target_path, -> { release_path }

# Keep the last 5 releases
set :keep_releases, 2


# Files and directories to symlink
append :linked_files, 'config/.env.production' # e.g., .env
append :linked_dirs, 'node_modules', '.next'

namespace :deploy do
  after :updated, :build_nextjs do
    on roles(:app) do
      within release_path do
        execute :npm, "run build"
      end
    end
  end
end

# Restart the Next.js app
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute "pm2 reload e-recruitment-anm || pm2 start npm --name e-recruitment-anm -- start"
    end
  end

  after :publishing, :restart
end
