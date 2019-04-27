class coredns(
  Stdlib::HTTPUrl $download_url_base = 'https://github.com/coredns/coredns/releases/download/',
  String $version = '1.5.0',
) {
  include coredns::install
}
