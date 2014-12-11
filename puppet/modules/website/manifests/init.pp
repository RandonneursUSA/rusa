
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
        source => "puppet:///modules/website/etc/nginx/default",
        owner => "root",
        group => "root",
    }

    file { '/etc/nginx/rusa_logo_selection':
        content => template("website/etc/nginx/rusa_logo_selection"),
        owner => "root",
        group => "root",
    }

    file {'/etc/uwsgi/apps-enabled/rusa-cgi.ini':
        source => "puppet:///modules/website/rusa-cgi.ini",
        owner => "root",
        group => "root",
   }
}
