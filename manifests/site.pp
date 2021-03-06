Exec { path => "/usr/sbin/:/sbin:/usr/bin:/bin" }
File { owner => 'root', group => 'root' }

node 'default' {
  import 'settings'

  include puppet
  include apt
  include ssh
  include sudo
  include iptables
  include cron
  include ppa
  include system
  include git
  include mysql
  include nginx
  include ntp
  include php
  include memcache
  include drush
  include mysqltuner
  include tuningprimer
  include mtop
  include htop
  include munin
  include unzip
}
