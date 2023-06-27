class Deployx < Formula
  desc "Compose-spec compliant rewrite of docker stack deploy"
  homepage "https://github.com/aaraney/deployx"
  url "https://github.com/aaraney/deployx/archive/v0.0.2.tar.gz"
  sha256 "ecfcb3351f99dd84ea1264d0b5f3c4a9fec8ac6929c2fde3198c568ddd82fc3e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"deployx"), "cmd/deployx/main.go"
  end

  def caveats
    <<~EOS
      Install deployx as a docker cli plugin by symbolic linking it to $HOME/.docker/cli-plugin:
        ln -s #{bin}/deployx $HOME/.docker/cli-plugin/docker-deployx

      After linking, you can invoke it using 'docker deployx'
    EOS
  end
end
