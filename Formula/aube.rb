class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.en.dev"
  url "https://github.com/endevco/aube/archive/refs/tags/v1.0.0-beta.12.tar.gz"
  sha256 "f7e69f6459b385f4917da6a0e9aa7aa3e3ad00e6c3400df4dac6a58c66d6809d"
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
