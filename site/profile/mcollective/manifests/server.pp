class profile::mcollective::server {
  $middleware_hosts = hiera("encore::mcollective::middleware_hosts")
  
  class { '::mcollective':
    middleware_hosts => $middleware_hosts,
  }
}
