# dd-repo-tools.rb, rendered from dd-repo-tools.rb.j2
#
# DesmoDyne RepoTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2020-06-19


# see also dd-bash-lib.rb


class DdRepoTools < Formula
  desc     "DesmoDyne RepoTools"
  homepage "https://github.com/desmodyne/RepoTools"
  url      "https://github.com/desmodyne/RepoTools/archive/0.0.1.tar.gz"
  sha256   "d7ab48edd132e4c039380c9583a0149165264a122034b8ed3e72a64b34b2cbd4"

  # NOTE: only req'd for CI/CD
  # depends_on "jinja2-cli"

  # req'd for realpath and others; sha256sum for CI/CD
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "git"

  def install
    bin.install      Dir["code/bin/*"]
    pkgshare.install Dir["code/tmpl/*"]
  end
end
