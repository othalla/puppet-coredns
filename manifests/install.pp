# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include coredns::install
class coredns::install (
){
  $download_url = "${coredns::download_url_base}v${coredns::version}/coredns_${coredns::version}_linux_${coredns::architecture}.tgz"

  archive { "/tmp/coredns-${coredns::version}.tgz":
    ensure          => present,
    extract         => true,
    extract_path    => '/opt',
    source          => $coredns::download_url,
    checksum_verify => false,
    creates         => "/opt/coredns-${prometheus::server::version}.${prometheus::server::os}-${prometheus::server::real_arch}/coredns",
    cleanup         => true,
  }
}
