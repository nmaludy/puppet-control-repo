class role::mcollective {
  notify {"${::fqdn} - Running in role::mcollective": withpath => true, }
  
  include profile::motd
  include profile::ntp
  include profile::snmp

  include profile::mcollective::middleware
  include profile::mcollective::client
}
