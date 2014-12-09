
class users {
  user {'rusa':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/rusa":
      source => "puppet:///modules/users/rusa",
      owner => "rusa",
      group => "rusa",
      recurse => true,
  }

  user {'git':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/git":
      source => "puppet:///modules/users/git",
      owner => "git",
      group => "git",
      recurse => true,
  }

  user {'dpb':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
  }

  file {"/home/dpb":
      source => "puppet:///modules/users/dpb",
      owner => "dpb",
      group => "dpb",
      recurse => true,
  }

  user {'iphands':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
    password => '$6$NEKzlXOx$w.mc1cznXQK8/Cp0Y1SWAPrEFJfMiAgKOGCp0QjlDegx/Y/IYjkj4621YPgLmMRrzhfgyQqOB..jk9ICb23jO.',
  }

  file {"/home/iphands":
      source => "puppet:///modules/users/iphands",
      owner => "iphands",
      group => "iphands",
      recurse => true,
  }

  user {'lynnef':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/lynnef":
      source => "puppet:///modules/users/lynnef",
      owner => "lynnef",
      group => "lynnef",
      recurse => true,
  }
}
