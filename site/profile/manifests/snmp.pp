# Profile to configure the SNMP service
class profile::snmp {

  # Hiera
  $snmp_contact      = hiera('encore::snmp::contact')
  $snmp_location     = hiera('encore::snmp::location')
  $snmp_ro_community = hiera('encore::snmp::ro_community')
  $snmp_ro_network   = hiera('encore::snmp::ro_network')

  # Firewall
  if $::osfamily == 'RedHat' {
    if $::operatingsystemmajrelease >= '7' {
      # firewalld declares a bunch of resources
      include ::firewalld

      # check on host -
      # firewall-cmd --zone=public --query-service=snmp
      # firewall-cmd --info-service=snmp
      firewalld_service { 'Allow ports for the SNMP service in the public zone':
        ensure  => present,
        zone    => 'public',
        service => 'snmp',
      }
    }
    # end RHEL 7
    else {
      # firewall declares a bunch of resources
      include ::firewall

      # firewall iptables
      # check on host -
      # iptables | grep 161
      # note: all rules smust be prefixed by a number (standardizing on port number)
      firewall { '161 Allow SNMP port 161 TCP':
        dport  => 161,
        proto  => tcp,
        action => accept,
      }
      # note: all rules smust be prefixed by a number (standardizing on port number)
      firewall { '161 Allow SNMP port 161 UDP':
        dport  => 161,
        proto  => udp,
        action => accept,
      }
    }
    # end RHEL 6
  }
  # end RHEL

  # SNMP
  # https://forge.puppet.com/razorsedge/snmp
  class { '::snmp':
    # start at boot
    service_enable => true,
    # ensure running currently
    service_ensure => 'running',

    # SNMP config options
    # https://linux.die.net/man/5/snmpd.conf

    # Listen on UDP port 161 (SNMP port) on all ipv4 and ipv6
    agentaddress   => [ 'udp:161', 'udp6:161' ],
    contact        => $snmp_contact,
    location       => $snmp_location,
    ro_community   => $snmp_ro_community,
    ro_network     => $snmp_ro_network,
  }
  # end ::snmp
}
# end profile::snmp
