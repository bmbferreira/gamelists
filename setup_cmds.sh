source ./.env
gigalixir create_database --free $APP_NAME
gigalixir add_ssh_key "ssh-rsa $SSH_KEY $EMAIL"
gigalixir set_config $APP_NAME SECRET_KEY_BASE $SECRET_KEY_BASE
