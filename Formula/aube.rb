class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.en.dev"
  url "https://github.com/endevco/aube/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "556f1c3a6414db78e94c603d8a23ccc9df7540effba7f61ef838e637170636d7"
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
