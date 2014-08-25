# repo_elrepo

# About
Puppet module that configures the ELRepo repository
on Enterprise Linux (RHEL, CentOS) clients

"The ELRepo Project focuses on hardware related packages to enhance your
experience with Enterprise Linux. This includes filesystem drivers,
graphics drivers, network drivers, sound drivers, webcam and video drivers."
http://elrepo.org/tiki/tiki-index.php

# Changes
## New in 1.0.0
  * Updated the module to allow for complete parameterization

## New in 0.1.0
  * Initial release.

# Testing
  * This was tested on CentOS 5, 6 and 7 clients
  * Tested using Puppet 3.6.2

# Usage
  * Simple usage:
```
include repo_elrepo
```
  * Advanced usage:
```
class {'repo_elrepo':
  repourl       => 'http://myrepo/elrepo',
  enable_testing    => true,
}
```
  * Alternate usage via hiera YAML:
```
repo_elrepo::repourl: 'http://myrepo/elrepo'
repo_elrepo::enable_testing: true
```
# License
Apache Software License 2.0
