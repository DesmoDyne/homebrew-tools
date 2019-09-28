# dd-vault-tools.rb, rendered from dd-vault-tools.rb.j2
#
# DesmoDyne VaultTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also dd-bash-lib.rb


class DdVaultTools < Formula
  desc     "DesmoDyne VaultTools"
  homepage "https://github.com/desmodyne/VaultTools"
  url      "https://github.com/desmodyne/VaultTools/archive/0.0.1.tar.gz"
  sha256   "a4cba439b25f084d56674e3e389049aae778757e664c5cd9e57bce6d22fa8389"

  # TODO: these are only required for CI/CD test / upload / etc. scripts
  # req'd for realpath, sha256sum
  depends_on "coreutils"
  depends_on "jinja2-cli"

  # required to update default bash 3 to version 4 (or 5)
  # TODO: introduce convention if this should be listed here:
  # dd-bash-lib lists latest bash as dependency, but scripts
  # of this project also make use of bash 4+ features, e.g. arrays
  depends_on "bash"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "jq"
  depends_on "vault"
  depends_on "yq"

  # https://github.com/Homebrew/brew/blob/master/ ...
  #  ... docs/Formula-Cookbook.md#just-moving-some-files
  def install
    bin.install Dir["code/bin/*"]
  end
end
