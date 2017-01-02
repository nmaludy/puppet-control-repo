class profile::motd {
  include ::motd
  # class { '::motd':
  #   content => "This server, ${::fqdn}, is managed by Puppet\n",
  # }
}
