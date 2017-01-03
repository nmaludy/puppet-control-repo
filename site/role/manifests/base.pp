class role::base {
  include profile::motd
  include profile::ntp
  include profile::snmp
  # @note The term "server" in mcollective means that this is a node
  #       that receives mcollective requests and performs actions
  # @link https://docs.puppet.com/mcollective/overview_components.html
  include profile::mcollective::server
}

