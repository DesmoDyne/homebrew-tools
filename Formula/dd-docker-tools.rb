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
  url      "https://github.com/desmodyne/DockerTools/archive/0.0.1.tar.gz"
  sha256   "504fbf4874aef838d0fe4135918c7d90c27a58b9ca902ded2e1399601e717197"

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
