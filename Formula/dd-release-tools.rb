# dd-release-tools.rb, rendered from dd-release-tools.rb.j2
#
# DesmoDyne ReleaseTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also dd-bash-lib.rb and dd-docker-tools.rb.j2


class DdReleaseTools < Formula
  desc     "DesmoDyne ReleaseTools"
  homepage "https://github.com/desmodyne/ReleaseTools"
  url      "https://github.com/desmodyne/ReleaseTools/archive/0.0.1.tar.gz"
  sha256   "b6de976d66e6a27b40f90ba2b9fdecfe19ab6d7f45683764a8c841f4b21864a9"

  # NOTE: only req'd for CI/CD
  # depends_on "jinja2-cli"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"
  # req'd for realpath and others; sha256sum for CI/CD
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "jq"

  def install
    bin.install Dir["code/bin/*"]
  end
end
