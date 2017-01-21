# Profile for mcollective client (agent that directs the mcollective)
class profile::mcollective::client {
  # Hiera
  $middleware_hosts = hiera('encore::mcollective::middleware_hosts')

  # MCollective repo is required to install the software below
  include profile::mcollective::repo

  class { '::mcollective':
    client           => true,
    middleware_hosts => $middleware_hosts,
    # This is the installed location using the profile::mcollective::repo
    # we need to override this because the ::mcollective module
    # specifies the wrong location in: manifests/default.pp
    # This causes mcollective to fail to start unless changed.
    core_libdir      => '/usr/local/libexec/mcollective'
  }
}
