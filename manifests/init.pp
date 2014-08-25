# == Class: repo_elrepo
#
# Configure the CentOS 5 or 6 repositories and import GPG keys
#
# === Parameters:
#
# $repourl::                       The base repo URL, if not specified defaults to the
#                                  elrepo Mirror
#                                  
# $enable_elrepo::                   Enable the elrepo Repo
#                                  type:boolean
#
# $enable_debuginfo::              Enable the elrepo Debuginfo Repo
#                                  type:boolean
#
# $enable_source::                 Enable the elrepo source Repo
#                                  type:boolean
#
# $enable_testing::                Enable the elrepo testing Repo
#                                  type:boolean
#
# $enable_testing_debuginfo::      Enable the elrepo testing debuginfo Repo
#                                  type:boolean
#
# $enable_testing_source::         Enable the elrepo testing source Repo
#                                  type:boolean
#
# === Usage:
# * Simple usage:
#
#  include repo_elrepo
#
# * Advanced usage:
#
#   class {'repo_elrepo':
#     repourl       => 'http://myrepo/elrepo',
#     enable_testing    => true,
#   }
#
# * Alternate usage via hiera YAML:
#
#   repo_elrepo::repourl: 'http://myrepo/elrepo'
#   repo_elrepo::enable_testing: true
#
class repo_elrepo (
    $repourl                       = $repo_elrepo::params::repourl,
    $enable_elrepo                 = $repo_elrepo::params::enable_elrepo,
    $enable_extras                 = $repo_elrepo::params::enable_extras,
    $enable_kernel                 = $repo_elrepo::params::enable_kernel,
    $enable_testing                = $repo_elrepo::params::enable_testing,
  ) inherits repo_elrepo::params {

  validate_string($repourl)
  validate_bool($enable_elrepo)
  validate_bool($enable_extras)
  validate_bool($enable_kernel)
  validate_bool($enable_testing)
  
  if $::osfamily == 'RedHat' {
    include repo_elrepo::elrepo
    
    repo_elrepo::rpm_gpg_key{ "RPM-GPG-KEY-elrepo.org":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org":
      ensure => present,
      owner  => 0,
      group  => 0,
      mode   => '0644',
      source => "puppet:///modules/repo_elrepo/RPM-GPG-KEY-elrepo.org",
    }

  } else {
      notice ("Your operating system ${::operatingsystem} does not need elrepo repositories")
  }

}
