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
  url      "https://github.com/desmodyne/DockerTools/archive/0.0.4.tar.gz"
  sha256   "730485625fec23a66f36f0bf57449979898d57af5362ef56988a0eaafd8b0d6c"

  depends_on "awscli"
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "docker"
  depends_on "docker-compose"
  depends_on "jq"
  depends_on "yq"

  def install
    # https://github.com/Homebrew/brew/blob/master/ ...
    #  ... docs/Formula-Cookbook.md#just-moving-some-files
    bin.install Dir["code/bin/*"]
  end
end
