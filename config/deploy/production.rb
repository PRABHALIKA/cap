# Simple Role Syntax
# ==================
#ask(:password, echo: false)
        #server "10.18.83.134", port: 22, password: fetch(:password), roles: %w{web app db}
set :stage, :production
server "10.18.83.134", roles: [:app, :web, :db], :primary => true , port: 22, password: fetch(:password)
set :ssh_options,
{
forward_agent: true ,
keys: %w(/home/knome/.ssh/id_rsa.pub),
port: 22
}
#ask(:password, nil, echo: false)

# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{10.18.83.134}
role :web, %w{10.18.83.134}
role :db,  %w{10.18.83.134}

# Capistrano > 3.2.0 supports echo: false
#ask(:password, echo: false)
#server '10.18.83.134', user: 'cap_user', port: 22, password: fetch(:password), roles: %w{web app db} ,my_property: :my_value

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '10.18.83.134', user: 'cap_user', roles: %w{web app db}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
