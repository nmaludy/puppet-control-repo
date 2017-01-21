# Profile that configures /etc/motd
class profile::motd {

  $encore_motd_content = hiera('encore::motd::content', undef)

  # if the content is defined, then override it
  if $encore_motd_content {
    class { '::motd':
      content => "${encore_motd_content}\n",
    }
  }
  else {
    # otherwise just use the base motd
    include ::motd
  }
  # end profile::motd
}
