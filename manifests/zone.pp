# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   coredns::zone { 'namevar': }
define coredns::zone(
  Optional[Stdlib::Port] $listen_port = undef,
  String[1] $zone = $title,
  Boolean $prometheus = false,
  Optional[Stdlib::IP::Address] $prometheus_listen_address = undef,
  Optional[Stdlib::Port] $prometheus_listen_port = undef,
  Boolean $log = false,
) {
  include ::coredns
  concat::fragment{ "Corefile-${title}":
    target  => "${coredns::config_dir}/Corefile",
    content => template('coredns/Corefile.erb'),
  }

}
