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
  url      "https://github.com/desmodyne/RepoTools/archive/0.0.2.tar.gz"
  sha256   "7be781748b86186e0bacdd85b02b0f36af2e4cacb5fbc3a492954c9b3730c4b2"

  # NOTE: only req'd for CI/CD
  # depends_on "jinja2-cli"

  # req'd for realpath and others; sha256sum for CI/CD
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "git"

  def install
    bin.install      Dir["code/bin/*"]
  end
end
