# config valid for current version and patch releases of Capistrano
lock "~> 3.14.0"

# before 'deploy', 'rvm1:install:ruby'
# set :rvm_map_bins, [ 'rake', 'gem', 'bundle', 'ruby', 'puma', 'pumactl' ]
set :application, "Rocket_Elevators_Foundation"
set :repo_url, "https://github.com/maximeparent/Rocket-Elevators.git"
set :rvm_ruby_version, "ruby-2.6.5"
set :rvm_ruby_string, :local
set :deploy_to, "/home/ubuntu/deploy/#{fetch :application}"
# set :pty, true
# set :ssh_options, {
#   forward_agent: true,
#   auth_methods: %w[publickey],
#   keys: %w[/home/alex/deploy/key.pem]
# }
set :keep_releases, 3

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
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# before "deploy:assets:precompile", "deploy:yarn_install"
 
# namespace :deploy do
#  desc 'Run rake yarn:install'
#  task :yarn_install do
#    on roles(:web) do
#      within release_path do
#        execute("cd #{release_path} && yarn install")
#      end
#    end
#  end
# end
