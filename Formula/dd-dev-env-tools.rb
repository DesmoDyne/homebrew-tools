# dev-env.rb
#
# DevEnv brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2017-09-14


# see also .../DesmoDyne/Homebrew/Tools/Formula/release-tools.rb


class DevEnv < Formula
  desc "DesmoDyne DevEnv"
  homepage "https://gitlab.com/DesmoDyne/Tools/DevEnv"
  url "https://gitlab.com/DesmoDyne/Tools/DevEnv/repository/archive.tar.gz?ref=0.0.1&private_token=#{ENV['GITLAB_HOMEBREW_TOKEN']}"
  sha256 "c490c075b79150c2a3dacf5bc0cc5cfebc93f748046f145d10ab955ef77b2e1d"
  version "0.0.1"

  # required to update default bash 3 to version 4
  depends_on "bash"
  # contains realpath and other GNU shell utilities
  depends_on "coreutils"
  # required by dd-make-icon-set to convert images
  # TODO: how to ensure brew install parameter ?
  #   brew install imagemagick --with-librsvg
  # there is no built-in support in Homebrew:
  # https://github.com/caskroom/homebrew-cask/issues/8784
  # https://github.com/caskroom/homebrew-cask/issues/22825
  depends_on "imagemagick"
  # required by mount-host to mount remote ssh file systems
  depends_on "sshfs"

  # TODO: build and install AppleScript applications:
  # requires osacompile and iconutil from XCode - how to add dependency ?
  # TODO: build them first and ship a brew cask package ?
  # or ship brew (source) package and build on the target host ?

  def install
    bin.install "./code/bin/dd-make-icon-set"
    bin.install "./code/bin/mount-host"
  end
end
