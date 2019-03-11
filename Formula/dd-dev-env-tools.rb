# dd-dev-env-tools.rb
#
# DesmoDyne DevEnvTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-11


# see also dd-bash-lib.rb


class DdDevEnvTools < Formula
  desc     "DesmoDyne DevEnvTools"
  homepage "https://github.com/desmodyne/devenvtools"
  url      "https://github.com/desmodyne/devenvtools/archive/0.0.2.tar.gz"
  sha256   "07a090935041d6470d26aff7b169567869b62810a245dd1e4b64e574ca8f2dce"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"
  depends_on "jq"
  depends_on "yq"

  def install
    bin.install "code/bin/dd-download-repos"
  end
end
