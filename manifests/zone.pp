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
  Boolean $errors = false,
  Boolean $forward = false,
  String $forward_from = '.',
  Optional[Array[String]] $forward_to = undef,
  Optional[String] $auto = undef,
  Optional[Hash] $auto_config = undef,
) {
  if $forward {
    if $forward_to == undef {
      fail('coredns: forward_to must be set')
    }
  }
  if $auto {
    if $auto_config == undef {
      fail('coredns: auto_config must be set')
    }
  }
  include ::coredns
  concat::fragment{ "Corefile-${title}":
    target  => "${coredns::config_dir}/Corefile",
    content => template('coredns/Corefile.erb'),
  }

}
