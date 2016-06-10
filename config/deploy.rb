lock '3.4.0'

set :application, 'TODO: directory in the server'
set :repo_url, 'TODO: repo URL'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
set :rbenv_path, '/home/ubuntu/.rbenv'

set :passenger_restart_with_touch, true
