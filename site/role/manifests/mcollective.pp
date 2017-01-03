class role::mcollective {
  include profile::motd
  include profile::ntp
  include profile::snmp

  include profile::mcollective::middleware
  include profile::mcollective::client
}
