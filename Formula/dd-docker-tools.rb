# dd-docker-tools.rb, rendered from dd-docker-tools.rb.j2
#
# DesmoDyne DockerTools brew formula
#
# author  : stefan schablowski
# contact : stefan.schablowski@desmodyne.com
# created : 2019-03-31


# see also dd-bash-lib.rb


class DdDockerTools < Formula
  include Language::Python::Virtualenv

  desc     "DesmoDyne DockerTools"
  homepage "https://github.com/desmodyne/DockerTools"
  url      "https://github.com/desmodyne/DockerTools/archive/0.0.6.tar.gz"
  sha256   "7ef43a62a508891793342f907b2274b1f9763ed9ecd8b894d9ab213d27d35fee"

  # req'd for realpath and others
  depends_on "coreutils"
  depends_on "desmodyne/tools/dd-bash-lib"
  depends_on "docker"
  depends_on "docker-compose"
  depends_on "jq"
  depends_on "python@3.8"
  depends_on "yq"

  # NOTE: see https://github.com/Homebrew/brew/blob/master/docs/ ...
  #  ... Python-for-Formula-Authors.md#installing for how to generate these:

  # ----------------------------------------------------------------------------
  # fabric python package and dependencies

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/d8/ba/21c475ead997ee21502d30f76fd93ad8d5858d19a3fad7cd153de698c4dd/bcrypt-3.2.0.tar.gz"
    sha256 "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8/cffi-1.14.2.tar.gz"
    sha256 "ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/12/be/c9cc7d7ab71dbcc9e4e517ead0cdd48e8c9a48d7b8bdddb738e90d08279a/cryptography-3.1.tar.gz"
    sha256 "26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08"
  end

  resource "fabric" do
    url "https://files.pythonhosted.org/packages/f9/14/e81b9425d450de0f34d8c49b46133aa5554a7f4f1f1f2e7857e66dfa270b/fabric-2.5.0.tar.gz"
    sha256 "24842d7d51556adcabd885ac3cf5e1df73fc622a1708bf3667bf5927576cdfa6"
  end

  resource "invoke" do
    url "https://files.pythonhosted.org/packages/b6/08/b345475cfaaa542ae78a172d5b23979ad0577f15a32b16e5e54b2a7e80c6/invoke-1.4.1.tar.gz"
    sha256 "de3f23bfe669e3db1085789fd859eb8ca8e0c5d9c20811e2407fa042e8a5e15d"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0/paramiko-2.7.2.tar.gz"
    sha256 "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz"
    sha256 "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/cf/5a/25aeb636baeceab15c8e57e66b8aa930c011ec1c035f284170cacb05025e/PyNaCl-1.4.0.tar.gz"
    sha256 "54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  # ----------------------------------------------------------------------------
  # pyyaml python package

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end


  # https://github.com/Homebrew/brew/blob/master/ ...
  #  ... docs/Python-for-Formula-Authors.md#example
  def install
    bin.install      Dir["code/bin/*"]
    pkgshare.install Dir["code/tmpl/*"]
    virtualenv_install_with_resources
  end
end
