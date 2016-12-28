class profile::base {
  file { 'motd':
    path    => '/etc/motd',
    content => "This server, ${::fqdn}, is managed by Puppet\n",
  }

  include profile::ntp
  include profile::snmp
}

