class profile::mcollective::middleware {
  include ::activemq

  # ActiveMQ was throwin errors in its log file: /var/log/activemq/activemq.log
  #  2017-01-04 18:11:43,699 [main           ] INFO  SharedFileLocker               - Database activemq-data/puppetmco.maludy.home/KahaDB/lock is locked... waiting 10 seconds for the database to be unlocked. Reason: java.io.IOException: Failed to create directory 'activemq-data/puppetmco.maludy.home/KahaDB'
  # According to this link http://stackoverflow.com/questions/26757680/could-not-connect-to-activemq-server-activemq-for-mcollective-failing
  #
  # A symlink is missing in the ActiveMQ RPM
  #   /usr/share/activemq/activemq-data -> /var/cache/activemq/data/
  #
  # After creating this symlink and restarting ActiveMQ
  # the errors stopped
  #  ln -s /var/cache/activemq/data /usr/share/activemq/activemq-data

  # preferred symlink syntax
  file { "/usr/share/activemq/activemq-data":
    ensure => "link",
    target => "/var/cache/activemq/data",
  }

  # Because the activemq module doesn't expose an "enabled"
  # value, and they don't enable the service by default, we have
  # to extend their Service definition and add the enabled
  # setting.
  class amq::service inherits ::activemq::service {    
    Service["activemq"] {
      enable => true,
    }
  }
  include amq::service

  # Firewall
  if $::osfamily == "RedHat" and $::operatingsystemmajrelease >= "7" {
    include ::firewalld
    
    firewalld_service { "activemq-stomp":
      ensure   => present,
      zone     => 'public',
      port     => '61613',
      protocol => 'tcp',
    }
    firewalld_service { "activemq-stomp-secure":
      ensure   => present,
      zone     => 'public',
      port     => '61614',
      protocol => 'tcp',
    }
  }
}
