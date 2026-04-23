class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.en.dev"
  url "https://github.com/endevco/aube/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ba0e76f3ccbd7cec11d2bd57f7b25335ae2b6131a5e832f5b18d561a8ef4f033"
  license "MIT"

  depends_on "rust" => :build
  depends_on "usage" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aube")
    generate_completions_from_executable(bin/"aube", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aube --version")
    assert_match "Usage:", shell_output("#{bin}/aube --help")
  end
end
