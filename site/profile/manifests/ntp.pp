# Profile to configure the NTP service
class profile::ntp {

  # Hiera
  $hiera_ntp_serers = hiera('encore::ntp::servers')

  # Firewall
  if $::osfamily == 'RedHat' {
    if $::operatingsystemmajrelease >= '7' {
      # firewalld declares a bunch of resources
      include ::firewalld
      # check on host -
      # firewall-cmd --zone=public --query-service=ntp
      # firewall-cmd --info-service=ntp
      firewalld_service { 'Allow ports for the NTP service in the public zone':
        ensure  => present,
        zone    => 'public',
        service => 'ntp',
      }
    }
    # end RHEL 7
    else {
      # firewall declares a bunch of resources
      include ::firewall
      # firewall iptables
      # check on host -
      # iptables | grep 123
      firewall { 'Allow NTP port 123 UDP':
        dport  => 123,
        proto  => udp,
        action => accept,
      }
    }
    # end RHEL 6
  }
  # end RHEL

  # NTP
  #
  #  - install ntp
  #  - configure client (/etc/ntp.conf)
  #  - enable and start the service
  #  - restrict access to local host (not a server)
  class { '::ntp':
    # start at boot
    service_enable => true,
    # ensure running currently
    service_ensure => 'running',
    # NTP servers (array)
    servers        => $hiera_ntp_serers,
  }
  # end ::ntp
}
# end profile::ntp
