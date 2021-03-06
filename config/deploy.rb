# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "chat-space"
set :repo_url, "https://github.com/Nacchamu/chat-space.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

# set :ssh_options, auth_methods: ['publickey'],
#                   keys: ['.ssh/nacchamu_chat-space.pem']

set :ssh_options, {
  # ローカル環境のユーザーの秘密鍵ファイルを設定する
  keys: %w(/home/local_user_home/.ssh/chat-space_key_rsa),
  forward_agent: true,
}

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# set :default_env, {
#   rbenv_root: "/usr/local/rbenv",
#   path: "~/.rbenv/shims:~/.rbenv/bin:$PATH",
#   AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
#   AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
# }
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :sidekiq_queue, :carrierwave


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
