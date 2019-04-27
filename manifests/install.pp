# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include coredns::install
class coredns::install (
){
  $download_url = "${coredns::download_url_base}v${coredns::version}/coredns_${coredns::version}_linux_${coredns::real_arch}.tgz"

  archive { "/tmp/coredns-${coredns::version}.tgz":
    ensure          => present,
    extract         => true,
    extract_path    => $coredns::install_dir,
    source          => $download_url,
    checksum_verify => false,
    creates         => "/opt/coredns",
    cleanup         => true,
  }
  group { $coredns::user:
    ensure => present,
  }
  -> user { $coredns::user:
    ensure     => present,
    groups     => $coredns::user,
    shell      => '/usr/sbin/nologin',
    password   => '*',
    managehome => false,
    home       => '/nonexistent',
  }
}
