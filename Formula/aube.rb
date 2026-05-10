class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.en.dev"
  url "https://github.com/endevco/aube/archive/refs/tags/v1.10.2.tar.gz"
  sha256 "e07d6e56e64a4bd0e562b24b34449f78044ed0f03cd72241bd39975d240f7378"
  license "MIT"

  depends_on "rust" => :build
  depends_on "usage" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aube")
    generate_completions_from_executable(bin/"aube", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aube --version")
    assert_match "Usage:", shell_output("#{bin}/aube --help")
  end
end
