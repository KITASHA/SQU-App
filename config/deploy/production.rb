server "54.249.128.34", user: "ubuntu", roles: %w{app db web}

set :ssh_options, {
  keys: %w(/home/kitagawa/.ssh/LightsailDefaultKey-ap-northeast-1.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}
