# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include coredns::install
class coredns::install (
){
  $download_url = "${coredns::download_url_base}v${coredns::version}/coredns_${coredns::version}_linux_${coredns::real_arch}.tgz"

  file { "${coredns::install_dir}/coredns-${coredns::version}" :
    ensure => 'directory',
    mode   => '0755',
  }
  ->
  archive { "/tmp/coredns-${coredns::version}.tgz":
    ensure          => present,
    extract         => true,
    extract_path    => "${coredns::install_dir}/coredns-${coredns::version}",
    source          => $download_url,
    checksum_verify => false,
    creates         => "${coredns::install_dir}/coredns-${coredns::version}/coredns",
    cleanup         => true,
  }
  ->
  #symlink for the service
  file { "${coredns::install_dir}/coredns":
    force  => true,
    target => "${coredns::install_dir}/coredns-${coredns::version}/coredns",
    notify => Service['coredns'],
  }

  group { $coredns::user:
    ensure => present,
    system => true,
  }
  -> user { $coredns::user:
    ensure     => present,
    groups     => $coredns::user,
    shell      => '/usr/sbin/nologin',
    password   => '*',
    managehome => false,
    home       => '/nonexistent',
    system     => true,
  }
}
