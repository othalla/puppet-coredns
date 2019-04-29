# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   coredns::zone { 'namevar': }
define coredns::zone(
  Stdlib::Port $listen_port = 53,
  String[1] $zone = $title,
  Boolean $prometheus = false,
  Stdlib::IP::Address $prometheus_listen_address = '127.0.0.1',
  Stdlib::Port $prometheus_listen_port = 9153,
) {
  include ::coredns
  concat::fragment{ "Corefile-${title}":
    target  => "${coredns::config_dir}/Corefile",
    content => template('coredns/Corefile.erb'),
  }

}
