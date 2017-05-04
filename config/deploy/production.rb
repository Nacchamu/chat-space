server '52.196.66.172', user: 'natsuki-cs', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/chat-space_key_rsa'
