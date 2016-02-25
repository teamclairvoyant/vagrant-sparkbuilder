node default {
#  service { 'nfslock': ensure => stopped, enable => false, }
#  service { 'rpcbind': ensure => stopped, enable => false, }
#  service { 'auditd': ensure => stopped, enable => false, }
#  service { 'abrt-ccpp': ensure => stopped, enable => false, }
#  service { 'abrtd': ensure => stopped, enable => false, }
#  package { 'yum-presto': ensure => latest, }
  package { 'wget': ensure => present, }
  class { 'jdk_oracle': version => '8', }
}
