class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.36"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.36/lizr_darwin_arm64"
      sha256 "ddbbd9ee4ecda1efdadc33ef97e7959e8548296bafc11265d35b6940fa162efd"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.36/lizr_darwin_amd64"
      sha256 "90f785c995e6c0ebe26e20bf7464203ed2804d79d16c2053860edf555a5a7baa"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.36/lizr_linux_arm64"
      sha256 "98ce811ad79f4e07bf16cb298d16c9ed29adddea40498ff837044655b92e0bbe"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.36/lizr_linux_amd64"
      sha256 "9d0b185a9eba247d44c4566e66feaa7d6c3d7125afb8f16fc6da2aa21b5abc31"
    end
  end

  def install
    binary = Dir["lizr_*"].first || "lizr"
    bin.install binary => "lizr"
  end

  def caveats
    <<~EOS
      Get started:
        lizr auth      # Sign in to your Lizr account
        lizr connect   # Start the proxy
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lizr --version")
  end
end
