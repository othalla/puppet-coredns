class coredns(
  Stdlib::HTTPUrl $download_url_base = 'https://github.com/coredns/coredns/releases/download/',
  String $version = '1.5.0',
) {

  case $arch {
    'x86_64', 'amd64':            { $real_arch = 'amd64' }
    'aarch64':                    { $real_arch = 'arm64' }
    'armv7l', 'armv6l', 'armv7l': { $real_arch = 'armv' }
    default:           {
      fail("Unsupported kernel architecture: ${arch}")
    }
  }
  include coredns::install
}
