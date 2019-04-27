# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include coredns::config
class coredns::config {

  file { $coredns::config_dir:
    ensure => directory,
  }
  -> file { "${coredns::config_dir}/Corefile":
    ensure => present,
    content => template('coredns/Corefile.erb')
  }
}
