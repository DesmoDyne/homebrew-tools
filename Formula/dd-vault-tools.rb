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
  url      "https://github.com/desmodyne/VaultTools/archive/0.0.3.tar.gz"
  sha256   "b7fc7e8ba69632c48a7399db57acb39c258e9626a6f139d3faa059c267b20d2b"

  # req'd for realpath and others
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "git"
  depends_on "jinja2-cli"
  depends_on "jq"
  depends_on "vault"
  depends_on "yq"

  def install
    bin.install      Dir["code/bin/*"]
    pkgshare.install Dir["code/tmpl/*"]
  end
end
