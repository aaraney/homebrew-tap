class Deployx < Formula
  desc "Compose-spec compliant rewrite of docker stack deploy"
  homepage "https://github.com/aaraney/deployx"
  url "https://github.com/aaraney/deployx/archive/v0.0.1.tar.gz"
  sha256 "e6296f0474d113923e689ad8ed09c87cf484d46a58e9ea6f9ac2fd57141df5c7"
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
