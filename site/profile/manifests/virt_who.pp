# Profile that manages the virt-who service
# @link http://www.vmwareadmins.com/using-puppet-manage-virt-map-virtual-guests-physical-hosts/
# @link https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/1/html/RHSM/register-virtual.html
class profile::virt_who {

  # lookup data from hiera
  $hiera_virt_who_vcenter  = hiera('encore::virt_who::vcenter')
  $hiera_virt_who_username = hiera('encore::virt_who::username')
  $hiera_virt_who_password = hiera('encore::virt_who::password')

  package { 'virt-who':
    ensure => installed,
    name   => 'virt-who',
    notify => File['/etc/virt-who.d/vcenter.conf']
  }

  file { '/etc/virt-who.d/vcenter.conf':
    ensure    => file,
    owner     => 'root',
    mode      => '0644',
    group     => 'root',
    # Note: the hiera_virt_who_* variables are passed to this template
    source    => template('virt-who.conf.erb'),
    subscribe => Package['virt-who'],
    notify    => Service['virt-who'],
  }

  service { 'virt-who':
    ensure    => running,
    enable    => true,
    name      => 'virt-who',
    subscribe => File['/etc/virt-who.d/vcenter.conf'],
  }
}
