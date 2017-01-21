# Base role which all other roles build off of
class role::base {
  notify {"${::fqdn} - Running in role::base": withpath => true, }

  include profile::util_packages
  include profile::motd
  include profile::ntp
  include profile::snmp
  # @note The term "server" in mcollective means that this is a node
  #       that receives mcollective requests and performs actions
  # @link https://docs.puppet.com/mcollective/overview_components.html
  # include profile::mcollective::server
}

