# dd-repo-tools.rb, rendered from dd-repo-tools.rb.j2
#
# DesmoDyne RepoTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2020-06-19


# see also dd-bash-lib.rb


# TODO: this formula fails to un- or re-install properly; workaround:
# $ brew uninstall dd-repo-tools
# $ rm -rf /usr/local/etc/dd-repo-tools
# $ brew install dd-repo-tools


class DdRepoTools < Formula
  desc     "DesmoDyne RepoTools"
  homepage "https://github.com/desmodyne/RepoTools"
  url      "https://github.com/desmodyne/RepoTools/archive/0.0.4.tar.gz"
  sha256   "3af360db0737ca9df867a0855cbecc09612e0e4266b17d7548b42ac3ae177c75"

  # req'd for realpath and others
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "git"

  def install
    bin.install      Dir["code/bin/*"]

    # https://discourse.brew.sh/t/bottling-etc-dirs/1919
    # TODO: seems like "the necessary magic" just fails with
    #   Error: An exception occurred within a child process:
    #     Errno::ENOENT: No such file or directory - dd-repo-tools
    # etc.install      "#{name}"

    # NOTE: use puts to print log output during installation

    # variables for directory locations:
    # https://docs.brew.sh/Formula-Cookbook#variables-for-directory-locations
    # puts "etc:       #{etc}"
    # puts "prefix:    #{prefix}"

    # available "instance attributes":
    # https://rubydoc.brew.sh/Formula.html

    # usual problem of these RoboDoc / RubyDoc / generated doc;
    # they look like documentation, but don't contain useful info:
    # https://www.rubydoc.info/github/Homebrew/brew/Formula:etc

    # https://rubydoc.brew.sh/Formula.html#full_name-instance_method
    # puts "full_name: #{full_name}"
    # https://rubydoc.brew.sh/Formula.html#name-instance_method
    # puts "name:      #{name}"
    # https://rubydoc.brew.sh/Formula.html#path-instance_method
    # puts "path:      #{path}"

    # NOTE: this copies conf/* to prefix, e.g.
    # /usr/local/Cellar/dd-repo-tools/0.0.3
    # prefix.install   Dir["conf/*"]

    # NOTE: adapted from man.mkpath:
    # https://docs.brew.sh/Formula-Cookbook#just-moving-some-files
    # I have no idea what this is supposed
    # to do - and it doesn't seem to do anything
    # etc.mkpath

    # NOTE: this by itself doesn't seem to do anything;
    # folder only seems to get created once e.g. a file is copied in
    # mkdir "#{prefix}/conf"

    # TODO: work done here must be manually cleaned up after uninstall:
    #   Uninstalling /usr/local/Cellar/dd-repo-tools/0.0.3... (5 files, 16.4KB)
    #   Warning: The following dd-repo-tools conf files have not been removed!
    #   If desired, remove them manually with `rm -rf`:
    #     /usr/local/etc/dd-repo-tools
    # even with 'def uninstall' in place, re-installing fails with
    #   Error: An exception occurred within a child process:
    #     Errno::EEXIST: File exists @ syserr_fail2_in - ...
    #      ... /usr/local/etc/dd-repo-tools/dd-rpt-get-repo-info.yaml

    # Ruby FileUtils:
    # https://ruby-doc.org/stdlib-2.7.1/libdoc/fileutils/rdoc/FileUtils.html

    # create folder in brew/Cellar/formula, e.g.
    # /usr/local/Cellar/dd-repo-tools/0.0.3
    mkdir "#{prefix}/conf"

    # copy conf/* to created folder
    cp Dir["conf/*"], "#{prefix}/conf/"

    # create folder /usr/local/etc/dd-repo-tools
    mkdir "#{etc}/#{name}"

    # create symlink to copied conf file
    # in /usr/local/etc/dd-repo-tools/
    # TODO: loop over all conf files
    # TODO: this creates a symlink
    #   /usr/local/Cellar/dd-repo-tools/0.0.3/conf/dd-rpt-get-repo-info.yaml
    # it should actually create a symlink
    #   ../../Cellar/dd-repo-tools/0.0.3/conf/dd-rpt-get-repo-info.yaml
    ln_s "#{prefix}/conf/dd-rpt-get-repo-info.yaml", "#{etc}/#{name}"
  end

  def uninstall
    # manually remove folder
    # NOTE: this doesn't seem to do anything;
    # warning doc'd above persists
    rmdir "#{etc}/#{name}"
  end
end
