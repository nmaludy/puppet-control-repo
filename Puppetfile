forge "http://forge.puppetlabs.com"

# Modules from the Puppet Forge
# Versions should be updated to be the latest at the time you start
#mod "puppetlabs/inifile",     '1.5.0'
#mod "puppetlabs/stdlib",      '4.11.0'
#mod "puppetlabs/concat",      '2.1.0'

# Modules from Git
# Examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
#mod 'apache',
#  :git    => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :commit => '83401079053dca11d61945bd9beef9ecf7576cbf'

#mod 'apache',
#  :git    => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :branch => 'docs_experiment'


##################
# Puppet Modules #
##################
# NOTE: Puppetfile does NOT handle module dependencies, so the following modules
#       need to be listed in the order in which they need to be installed

# stdlib
# link - https://forge.puppet.com/puppetlabs/stdlib
# dependencies - none
mod "puppetlabs/stdlib"

# motd
# link - https://forge.puppet.com/puppetlabs/motd
# dependencies -
#  - puppetlabs/registry (>= 1.0.0 < 2.0.0)
#  - puppetlabs/stdlib (>= 2.1.0 < 5.0.0)
mod "puppetlabs/registry"
mod "puppetlabs/motd"

# NTP
# link - https://forge.puppet.com/puppetlabs/ntp
# dependencies - puppetlabs/stdlib (>= 4.13.1 <5.0.0)
# version - < 5.0.0 because we're on puppet 3.6
mod "puppetlabs/ntp", "4.2.0"

# firewalld
# link - https://forge.puppet.com/crayfishx/firewalld
# dependencies - puppetlabs/stdlib (>=4.2.0 <5.0.0)
# version - < 3.0.0 because we're on puppet 3.6
mod "crayfishx/firewalld", "2.2.0"

# SNMP
# link - https://forge.puppet.com/razorsedge/snmp
# dependencies - puppetlabs/stdlib (>=2.3.0 <5.0.0)
mod "razorsedge/snmp"

# MCollective
# link - https://forge.puppet.com/puppet/mcollective/
# dependencies -
#  - richardc/datacat (>= 0.6.2 < 1.0.0)
#  - puppetlabs/stdlib (>=4.6.0 < 5.0.0)
# version - < 2.1.3 because we're on puppet 3.6
mod "richardc/datacat"
mod "puppet/mcollective", "2.1.1"
