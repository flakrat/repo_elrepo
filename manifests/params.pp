# Optional parameters in setting up CentOS Yum repository
class repo_elrepo::params {
  #$repourl = $::lsbmajdistrelease ? {
  #  5         => 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=elrepo-5&arch=$basearch',
  #  6         => 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=elrepo-6&arch=$basearch',
  #  7         => 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=elrepo-7&arch=$basearch',
  #  default   => undef,
  #}
  $enable_elrepo             = true
  $enable_extras             = false
  $enable_kernel             = false
  $enable_testing            = false
  $ostype                    = 'el'
  $urlbit                    = "${::operatingsystemmajrelease}"
  $repourl                   = "http://elrepo.org/linux"
}
