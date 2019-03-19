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
  url      "https://github.com/desmodyne/devenvtools/archive/0.0.3.tar.gz"
  sha256   "c677722e2bccd454646d5c0aae88bd06d619fb1a3203ffcb923af7de139f5428"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"
  depends_on "git-flow-avh"
  depends_on "gnu-sed"
  depends_on "jq"
  depends_on "yq"

  # requires tap added using `brew tap desmodyne/tools`
  depends_on "dd-bash-lib"

  def install
    bin.install      "code/bin/dd-download-repos"
    pkgshare.install "conf/dd-download-repos.sample.yaml"
  end
end
