node default {
#  service { 'nfslock': ensure => stopped, enable => false, }
#  service { 'rpcbind': ensure => stopped, enable => false, }
#  service { 'auditd': ensure => stopped, enable => false, }
#  service { 'abrt-ccpp': ensure => stopped, enable => false, }
#  service { 'abrtd': ensure => stopped, enable => false, }
#  package { 'yum-presto': ensure => latest, }
  package { 'deltarpm': ensure => present, }
  package { 'epel-release': ensure => present, }
  package { 'wget': ensure => present, }
  package { 'git': ensure => present, }
  class { 'jdk_oracle': version => '8', }
  file { '/etc/profile.d/java.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'export JAVA_HOME=/opt/java_home',
  }
}
