class profile::ntp {

  include ::stdlib
  # firewalld declares a bunch of resources
  include ::firewalld

  # Firewall
  if $::osfamily == "RedHat" and $::operatingsystemmajrelease >= "7" {
    # check on host -
    # firewall-cmd --zone=public --query-service=ntp
    # firewall-cmd --info-service=ntp
    firewalld_service {
      "Allow ports for the NTP service in the public zone":
        ensure   => present,
        zone     => "public",
        service  => "ntp",
    }
  }
  
  # NTP
  #  - install ntp
  #  - configure client (/etc/ntp.conf)
  #  - enable and start the service
  #  - restrict access to local host (not a server)
  class { "::ntp":
    servers => ["0.pool.ntp.org", "1.pool.ntp.org", "2.pool.ntp.org"],
    # start at boot
    service_enable => true,
    # ensure running currently
    service_ensure => true
  }
}

