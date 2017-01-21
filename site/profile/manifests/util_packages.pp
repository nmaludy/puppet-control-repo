# Profile that installs utility pckages for the OS
# @note any service-specific packages should be installed in their own
#       profile
class profile::util_packages {

  # @note Packages are organized alphabetically

  package { 'bind-utils':
    ensure => installed,
    name   => 'bind-utils',
  }

  if $::selinux == 'true' {
    package { 'checkpolicy':
      ensure => installed,
      name   => 'checkpolicy',
    }
  }

  package { 'curl':
    ensure => installed,
    name   => 'curl',
  }

  package { 'mailx':
    ensure => installed,
    name   => 'mailx',
  }

  package { 'mlocate':
    ensure => installed,
    name   => 'mlocate',
  }

  package { 'net-snmp-utils':
    ensure => installed,
    name   => 'net-snmp-utils',
  }

  package { 'ntpdate':
    ensure => installed,
    name   => 'ntpdate',
  }

  package { 'perl':
    ensure => installed,
    name   => 'perl',
  }

  if $::selinux == 'true' {
    package { 'policycoreutils':
      ensure => installed,
      name   => 'policycoreutils',
    }

    package { 'policycoreutils-python':
      ensure => installed,
      name   => 'policycoreutils-python',
    }
  }

  if $::osfamily == 'RedHat' {
    # Red Hat support sosreport utility
    package { 'sos':
      ensure => installed,
      name   => 'sos',
    }
  }

  package { 'wget':
    ensure => installed,
    name   => 'wget',
  }

  package { 'yum-utils':
    ensure => installed,
    name   => 'yum-utils',
  }

}
# end profile::util_packages
