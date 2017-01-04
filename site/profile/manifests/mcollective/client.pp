class profile::mcollective::client {
  # Hiera
  $middleware_hosts = hiera("encore::mcollective::middleware_hosts")

  # MCollective repo is required to install the software below
  include profile::mcollective::repo

  class { '::mcollective':
    client           => true,
    middleware_hosts => $middleware_hosts,
  }
}
