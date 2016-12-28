class profile::base {
  file { 'motd':
    path    => '/etc/motd',
    content => "Tomorrow is another day ${::fqdn}\n",
  }

  include ::profile::ntp
}

