class Ht < Formula
  desc "ht computes a hash tree (Merkle tree) using sha256 for a given directory and all of its descendants."
  homepage "https://github.com/aaraney/ht"
  url "https://github.com/aaraney/ht/archive/refs/tags/0.0.3.tar.gz"
  sha256 "26023def9bfe77eae5638eff38a07fc0874800ad6e7759b5dd0b9c8a4f0502f9"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ht")
  end
end
