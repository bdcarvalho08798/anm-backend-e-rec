# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

# set :application, "my_app_name"
# set :repo_url, "git@example.com:me/my_repo.git"

set :application, "dmsmof"
set :repo_url, "git@github.com:bdcarvalho08798/doc-sys.git"
set :branch, "master"
set :deploy_to, "/home/ifmisu/dms-prod/#{fetch :application}"
# set :deploy_to, "/home/maleky/doc-sys-prod/#{fetch :application}"
set :linked_files, %w{config/master.key}
set :linked_dirs,    %w{public/uploads}
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets public/system public/uploads public/assets]
# set :linked_files, %w{public/assets/doc.png}
# set :linked_files, %w{public/assets/mof.png}
# set :linked_files, %w{public/assets/open-folder.png}

# set :puma_conf, '/home/ifmisu/dms-prod/dmsmof/shared/puma.rb'

# set :puma_daemonize, false

# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
