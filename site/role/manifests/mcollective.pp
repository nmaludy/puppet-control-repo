class role::mcollective {
  notify {"${::fqdn} - Running in role::mcollective": withpath => true, }
  
  contain profile::motd
  contain profile::ntp
  contain profile::snmp

  contain profile::mcollective::repo
  contain profile::mcollective::middleware
  contain profile::mcollective::client

  contain ::fdsfds
}
