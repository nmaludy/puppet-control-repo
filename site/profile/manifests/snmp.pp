class profile::snmp {

  include ::stdlib
  # firewalld declares a bunch of resources
  include ::firewalld
  
  # Firewall
  if $::osfamily == "RedHat" and $::operatingsystemmajrelease >= "7" {
    # check on host -
    # firewall-cmd --zone=public --query-service=snmp
    # firewall-cmd --info-service=snmp
    firewalld_service {
      "Allow ports for the SNMP service in the public zone":
        ensure   => present,
        zone     => "public",
        service  => "snmp",
    }
  }

  # SNMP
  # https://forge.puppet.com/razorsedge/snmp
  class { '::snmp':
    # start at boot
    service_enable => true,
    # ensure running currently
    service_ensure => 'running',
    # SNMP options
    contact  => 'root@maludy.hom',
    location => 'Cincinnati, OH, USA, Earth, Milky Way',
    ro_community => 'myPassword',
  }
}

