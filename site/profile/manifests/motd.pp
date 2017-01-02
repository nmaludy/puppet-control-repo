class profile::motd {

  $encore_motd_content = hiera("encore::motd::content", undef)

  if $encore_motd_content {
    class { '::motd':
      content => "${encore_motd_content}\n",
    }
  }
  else {
    include ::motd
  }
}
