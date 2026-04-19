class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.en.dev"
  url "https://github.com/endevco/aube/archive/refs/tags/v1.0.0-beta.5.tar.gz"
  sha256 "e7d3df1a0b14e3a58aa64eeab31e7251f1bf988fb6faeb0a6b9f141774a4e7ba"
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
