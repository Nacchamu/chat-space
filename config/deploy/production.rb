server '52.196.66.172', user: 'natsuki-cs', roles: %w{app db web}
set :ssh_options, {
  # ローカル環境のユーザーの秘密鍵ファイルを設定する
  keys: %w(/home/local_user_home/.ssh/chat-space_key_rsa),
  forward_agent: true,
}
