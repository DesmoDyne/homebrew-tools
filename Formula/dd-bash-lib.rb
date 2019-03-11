# dd-bash-lib.rb
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


# formula file and Ruby class name concept:
# https://github.com/Homebrew/brew/blob/master/ ...
#  ... docs/Formula-Cookbook.md#a-quick-word-on-naming

class DdBashLib < Formula
  desc     "DesmoDyne BashLib"
  homepage "https://github.com/desmodyne/bashlib"
  url      "https://github.com/desmodyne/bashlib/archive/0.0.4.tar.gz"
  sha256   "13936368a0e019228febaa7c22e1306a388dccb4e4aac30f6f26f48148b01af2"

  # required to update default bash 3 to version 4 (or 5)
  depends_on "bash"

  # https://github.com/Homebrew/brew/blob/master/ ...
  #  ... docs/Formula-Cookbook.md#just-moving-some-files
  def install
    lib.install "code/lib/dd-bash-lib.sh"
  end
end
