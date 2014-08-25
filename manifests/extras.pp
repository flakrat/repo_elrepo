# extras.pp
class repo_elrepo::extras inherits repo_elrepo {

  if $repo_elrepo::enable_extras {
    $enabled = 1
  } else {
    $enabled = 0
  }

  yumrepo { 'elrepo-extras':
    baseurl  => "${repourl}/extras/${ostype}${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Extras Repository - ${ostype}${urlbit} - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    protect  => '0',
  }

}
