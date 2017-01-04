## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources
# https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
File { backup => false }

# Suppresses the following warning -
#
# Warning: The package type's allow_virtual parameter will be changing
# its default value from false to true in a future release. If you do not want
# to allow virtual packages, please explicitly set allow_virtual to false.
# (at /usr/share/ruby/vendor_ruby/puppet/type.rb:816:in `set_default')
#
# @link https://ask.puppet.com/question/6640/warning-the-package-types-allow_virtual-parameter-will-be-changing-its-default-value-from-false-to-true-in-a-future-release/
# @link https://inuits.eu/blog/puppet-361-depreciation-warning
Package {
  allow_virtual => true,
}

## Nodes ##

node default {
  # Assign the role from Hiera (cool trick)
  # https://ask.puppet.com/question/10960/using-variables-in-a-hiera-hierachy/
  #
  # @note the "default" node definition is contained in hieradata/base.yaml
  #       and will utilize the role role::base
  $encore_role = hiera("encore::role", "role::base")

  # debug to console when running puppet agent
  notify {"${::fqdn} - encore::role = ${encore_role}": withpath => true, }

  # include the role for this node
  # @note do NOT use hiera_include() here because hiera_include() does an
  #       "array merge", meaning that it finds all values of "encore::role" at
  #       every level of the hierarchy and merges them into one big array.
  #       This causes a problem when we want to override a node's role
  #       by specifying the new role in hieradata/node/node_fqdn.yaml.
  #       Instead if we simply perform a normal "include" using the role's
  #       name, then we achieve exactly what we want
  #
  # @link https://docs.puppet.com/hiera/3.2/puppet.html#assigning-classes-to-nodes-with-hiera-hierainclude
  include $encore_role
}
