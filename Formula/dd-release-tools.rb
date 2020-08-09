# dd-release-tools.rb, rendered from dd-release-tools.rb.j2
#
# DesmoDyne ReleaseTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also *Tools/cicd/tmpl/<tool name>.rb.j2


class DdReleaseTools < Formula
  desc     "DesmoDyne ReleaseTools"
  homepage "https://github.com/desmodyne/ReleaseTools"
  url      "https://github.com/desmodyne/ReleaseTools/archive/0.0.2.tar.gz"
  sha256   "da7d0f751a14a536815d16b218a225899766848ed46a2047b4a62e94c84f7049"

  # req'd for realpath and others
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "git"
  depends_on "jq"

  def install
    bin.install Dir["code/bin/*"]
    lib.install Dir["code/lib/*"]
  end
end
