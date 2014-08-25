# testing.pp
class repo_elrepo::testing inherits repo_elrepo {

  if $repo_elrepo::enable_testing {
    $enabled = 1
  } else {
    $enabled = 0
  }

  yumrepo { 'elrepo-testing':
    baseurl  => "${repourl}/testing/${ostype}${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Testing Repository - ${ostype}${urlbit} - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    protect  => '0',
  }

}
