# dd-bash-lib.rb, rendered from dd-bash-lib.rb.j2
#
# DesmoDyne BashLib brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-09


# general info on brew and brew formulae:
# https://docs.brew.sh
# https://github.com/Homebrew/brew/blob/master/docs/README.md
# https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
# https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md

# TODO: audit the formula:
# https://github.com/Homebrew/brew/blob/master/docs/ ...
#  ... Formula-Cookbook.md#audit-the-formula
# this currently fails to install to build some Ruby / gem native extensions:
# https://github.com/Homebrew/brew/issues/5561

# formula file and Ruby class name concept:
# https://github.com/Homebrew/brew/blob/master/ ...
#  ... docs/Formula-Cookbook.md#a-quick-word-on-naming

class DdBashLib < Formula
  desc     "DesmoDyne BashLib"
  homepage "https://github.com/desmodyne/BashLib"
  url      "https://github.com/desmodyne/BashLib/archive/0.0.11.tar.gz"
  sha256   "8159eb06bd148bd711e6ebcdde1e6d4bf399881e3888a1ac610c360555fffaab"

  # TODO: introduce convention if to list dependencies that macOS also provides:
  # curl, git, etc. might have to be installed if latest version is required

  # https://github.com/Homebrew/brew/blob/master/docs/ ...
  #  ... Formula-Cookbook.md#specifying-other-formulae-as-dependencies
  # NOTE: bats is required by the .../cicd/bin/test script and jinja2 (from
  # jinja2-cli brew package) for .../cicd/bin/upload; neither is needed
  # nor used in production, i.e. after the dd-bash-lib package is installed;
  # also, there is a mismatch between brew and DesmoDyne conventions:
  #  1. BashLib is a shell library which is not 'built' at all
  #     (as e.g. a C++ library would be compiled and linked)
  #  2. in order to test BashLib using 'brew test', the .../test/bats/*.bats
  #     would have to made available to production; however this would be
  #     be done for testing alone and not to actually use the library
  # therefore, neither brew build nor test concepts apply here at all:
  #   depends_on "bats" => :test
  #   depends_on "jinja2-cli" => :build
  # and these packages won't be installed as dependency of this formula,
  # but independently on the host that performs CI/CD test and upload:
  # depends_on "bats"
  # depends_on "jinja2-cli"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"
  # req'd for ggrep
  depends_on "grep"
  # req'd for gdate, greadlink, realpath and others; sha256sum for CI/CD
  depends_on "coreutils"
  # req'd for gxargs
  depends_on "findutils"
  # req'd for gsed
  depends_on "gnu-sed"
  depends_on "jo"
  depends_on "jq"
  depends_on "yq"

  # https://github.com/Homebrew/brew/blob/master/ ...
  #  ... docs/Formula-Cookbook.md#just-moving-some-files
  def install
    lib.install "code/lib/dd-bash-lib.sh"
  end

  # https://github.com/Homebrew/brew/blob/master/ ...
  #  ... docs/Formula-Cookbook.md#add-a-test-to-the-formula
  # TODO: find a way to 'brew test'; see comment above
  # test do
  #   # this fails; ${HOME} is empty
  #   system "${HOME}/cicd/bin/test"
  # end
end
