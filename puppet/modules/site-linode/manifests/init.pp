
class site-linode {

  file {'/usr/local/bin/backup-gdbm.sh':
    ensure => file,
    source => "puppet:///modules/site-linode/usr/local/bin/backup-gdbm.sh",
    owner => root,
    group => root,
    mode => 0755
  }

  file {'/etc/cron.d/backup-gdbm':
    ensure => file,
    source => "puppet:///modules/site-linode/etc/cron.d/backup-gdbm",
    owner => root,
    group => root,
    mode => 0644
  }

}
