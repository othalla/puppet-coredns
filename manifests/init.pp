class coredns(
  Stdlib::HTTPUrl $download_url_base = 'https://github.com/coredns/coredns/releases/download/',
  String $version = '1.5.0',
  Stdlib::Absolutepath $install_dir = '/opt',
  Stdlib::Absolutepath $config_dir = '/etc/coredns',
  String $user = 'coredns',
  Integer $listen_port = 53,
  Optional[String] $prometheus_config = undef,
) {

  case $::architecture {
    'x86_64', 'amd64':            { $real_arch = 'amd64' }
    'aarch64':                    { $real_arch = 'arm64' }
    'armv7l', 'armv6l', 'armv7l': { $real_arch = 'arm' }
    default:           {
      fail("Unsupported kernel architecture: ${arch}")
    }
  }
  include coredns::install
  include coredns::config
  include coredns::service
}
