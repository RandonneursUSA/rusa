
class website {

    package {'nginx':
	ensure => installed,
    }

    package {'uwsgi':
	ensure => installed,
    }

    # Need this for postback from paypal to work;
    package {'libwww-perl':
	ensure => installed,
    }

    # This is used to draw dots on the RUSA USA map;
    package {'imagemagick':
        ensure => installed,
    }

    package {'uwsgi-plugin-cgi':
	ensure => installed,
    }

    file { '/usr/share/nginx':
        ensure => "directory",
        owner => "rusa",
        group => "rusa",
        mode  => 0644,
        recurse => true,
    }

    file { '/etc/nginx/sites-available/default':
        content => template("website/etc/nginx/sites-available/default"),
        owner => "root",
        group => "root",
        notify => Package['nginx'],
    }

    file {'/etc/uwsgi/apps-enabled/rusa-cgi.ini':
        source => "puppet:///modules/website/rusa-cgi.ini",
        owner => "root",
        group => "root",
        notify => Package['uwsgi'],
    }

    service { "nginx":
        ensure => "running",
        enable => "true",
        require => Package["nginx"],
    }

    service {'uwsgi':
	ensure => "running",
        enable => "true",
        require => Package["uwsgi", "uwsgi-plugin-cgi"],
    }
}
