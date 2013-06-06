class drush {
  exec {
    'download-drush':
      command => 'wget -P /root http://ftp.drupal.org/files/projects/drush-7.x-5.9.tar.gz',
      creates => '/root/drush-7.x-5.9.tar.gz';
    'install-drush':
      cwd => '/opt',
      command => 'tar xzf /root/drush-7.x-5.9.tar.gz && chown -R root.root /opt/drush',
      creates => '/opt/drush/drush',
      require => Exec['download-drush'];
    'install-drush-console-table':
      command => '/opt/drush/drush',
      creates => '/opt/drush/includes/table.inc',
      require => [Exec['install-drush'], Package['php5-cli']];
  }

  file {
    '/usr/local/bin/drush':
      ensure => '/opt/drush/drush',
      require => Exec['install-drush'];
    ['/usr/share/drush', '/usr/share/drush/commands']:
      ensure => directory;
  }
}
