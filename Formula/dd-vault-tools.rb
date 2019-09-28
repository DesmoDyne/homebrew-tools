# dd-vault-tools.rb, rendered from dd-vault-tools.rb.j2
#
# DesmoDyne VaultTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also dd-bash-lib.rb and dd-docker-tools.rb.j2


class DdVaultTools < Formula
  desc     "DesmoDyne VaultTools"
  homepage "https://github.com/desmodyne/VaultTools"
  url      "https://github.com/desmodyne/VaultTools/archive/0.0.2.tar.gz"
  sha256   "a44dfcd65add33e68c7dbf93732cea705d8fff34a4a7abd9fab67869f48ab69c"

  # NOTE: only req'd for CI/CD
  # req'd for realpath, sha256sum
  # depends_on "coreutils"
  # depends_on "jinja2-cli"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "jq"
  depends_on "vault"
  depends_on "yq"

  def install
    bin.install Dir["code/bin/*"]
  end
end
