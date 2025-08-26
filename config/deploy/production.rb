server '54.249.128.34', user: 'ubuntu', roles: %w{app db web}, ssh_options: {
  keys: %w(~/.ssh/id_ed25519),
  forward_agent: true,
  auth_methods: %w(publickey)
}
