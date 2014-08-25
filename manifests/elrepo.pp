# elrepo.pp
class repo_elrepo::elrepo inherits repo_elrepo {

  #file { "/etc/yum.repos.d/elrepo${::operatingsystemmajrelease}.repo": ensure => absent, }
  if $repo_elrepo::enable_elrepo {
    $enabled = 1
  } else {
    $enabled = 0
  }

  yumrepo { 'elrepo':
    baseurl  => "${repourl}/elrepo/${::ostype}${::urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Repository - ${::ostype}${::urlbit} - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    protect  => '0',
  }

}
