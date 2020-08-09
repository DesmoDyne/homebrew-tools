# dd-docker-tools.rb, rendered from dd-docker-tools.rb.j2
#
# DesmoDyne DockerTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also dd-bash-lib.rb


class DdDockerTools < Formula
  desc     "DesmoDyne DockerTools"
  homepage "https://github.com/desmodyne/DockerTools"
  url      "https://github.com/desmodyne/DockerTools/archive/0.0.6.tar.gz"
  sha256   "fb08507fefdc3751a5bc9246c0e1acdd3a40ba438cf32cb0b48afb58331db600"

  # NOTE: only req'd for CI/CD
  # depends_on "jinja2-cli"

  # req'd for aws
  depends_on "awscli"
  # required to update default bash 3 to version 4 (or 5)
  # TODO: introduce convention if this should be listed here:
  # dd-bash-lib lists latest bash as dependency, but scripts
  # of this project also make use of bash 4+ features, e.g. arrays
  depends_on "bash"
  # req'd for realpath and others; sha256sum for CI/CD
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "docker"
  depends_on "docker-compose"
  depends_on "jq"
  depends_on "pipenv"
  depends_on "yq"

  def install
    bin.install      Dir["code/bin/*"]
    pkgshare.install Dir["code/tmpl/*"]
  end
end
