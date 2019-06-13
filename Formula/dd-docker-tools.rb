# dd-docker-tools.rb
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
  url      "https://github.com/desmodyne/DockerTools/archive/0.0.3.tar.gz"
  sha256   "1acdd14768b45c7503c2c074db1228344e372d988e2b15d78e47cf1dee3e3abb"

  depends_on "awscli"
  depends_on "coreutils"
  depends_on "docker"
  depends_on "docker-compose"
  depends_on "jq"
  depends_on "yq"

  # requires tap added using `brew tap desmodyne/tools`
  depends_on "dd-bash-lib"

  def install
    # https://github.com/Homebrew/brew/blob/master/ ...
    #  ... docs/Formula-Cookbook.md#just-moving-some-files
    bin.install Dir["code/bin/*"]
  end
end
