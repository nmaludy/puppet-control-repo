class profile::mcollective::repo {
  # Yum repo
  if $::osfamily == "RedHat" {
    package { "puppetlabs-release yum repository":
      provider => rpm,
      name     => "puppetlabs-release",
      ensure   => present,
      source   => "https://yum.puppetlabs.com/puppetlabs-release-el-${::operatingsystemmajrelease}.noarch.rpm"
    }
  } # end if OS family == "RedHat"
} # end class profile::mcollective::repo
