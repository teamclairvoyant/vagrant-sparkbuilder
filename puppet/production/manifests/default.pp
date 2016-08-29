node default {
  service { 'nfslock': ensure => stopped, enable => false, }
  service { 'rpcbind': ensure => stopped, enable => false, }
  service { 'abrt-ccpp': ensure => stopped, enable => false, }
  service { 'abrtd': ensure => stopped, enable => false, }
  service { 'anacron': ensure => stopped, enable => false, }
  service { 'postfix': ensure => stopped, enable => false, }
  service { 'tuned': ensure => stopped, enable => false, }
  service { 'crond': ensure => stopped, enable => false, }
  service { 'gssproxy': ensure => stopped, enable => false, }
  package { 'deltarpm': ensure => present, }
  package { 'epel-release': ensure => present, }
  package { 'patch': ensure => present, }
  package { 'rsync': ensure => present, }
  class { 'jdk_oracle': version => 8, }
  class { 'git': }
  vcsrepo { '/home/vagrant/spark':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/cloudera/spark.git',
    revision => 'cdh5.7.0-release',
    user     => 'vagrant',
    require  => Class['git'],
  }
}
