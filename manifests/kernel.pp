# kernel.pp
class repo_elrepo::kernel inherits repo_elrepo {

  if $repo_elrepo::enable_kernel {
    $enabled = 1
  } else {
    $enabled = 0
  }

  yumrepo { 'elrepo-kernel':
    baseurl  => "${repourl}/kernel/${::ostype}${::urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Kernel Repository - ${::ostype}${::urlbit} - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    protect  => '0',
  }

}
