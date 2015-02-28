
class systools {
    package {'python-dev':
        ensure => installed,
    }

    # So we can decrypt ~git/.ssh/id_rsa.nc;
    package {'mcrypt':
        ensure => installed,
    }

    exec {'python-fabric':
        command => "/usr/bin/pip install fabric",
        creates => "/usr/local/bin/fab",
        require => Package['python-dev'],
    }
}
