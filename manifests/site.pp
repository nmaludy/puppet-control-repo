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

# Disable filebucket by default for all File resources:
#https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example
  #   class { 'my_class': }

  # Assign the role from Hiera (cool trick)
  # https://ask.puppet.com/question/10960/using-variables-in-a-hiera-hierachy/
  $role = hiera("encore::role", "::role::base")
  $profiles = hiera("encore::profiles")
  include $profiles
    
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
}

# Allow assigning additional profiles (classes) to nodes in Hiera
# https://docs.puppet.com/hiera/3.2/complete_example.html#using-hierainclude
# @note we don't want to allow this because we want these to be managed by
#       a Role
# hiera_include("encore::profiles", "")

