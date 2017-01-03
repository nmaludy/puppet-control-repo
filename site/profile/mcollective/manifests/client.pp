class profile::mcollective::client {
  $middleware_hosts = hiera("encore::mcollective::middleware_hosts")
  
  class { '::mcollective':
    client           => true,
    middleware_hosts => $middleware_hosts,
  }
}
