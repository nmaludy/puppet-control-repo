class role::mcollective {
  contain profile::motd
  contain profile::ntp
  contain profile::snmp

  contain profile::mcollective::repo
  contain profile::mcollective::middleware
  contain profile::mcollective::client
  contain activemq
}
