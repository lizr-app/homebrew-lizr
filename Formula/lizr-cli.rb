class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.31"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/1.0.31/lizr_darwin_arm64"
      sha256 "4be65393fdc292272ec27ff59630b84b4322539de3d841ae9fa6de7c9ecc0cc1"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.31/lizr_darwin_amd64"
      sha256 "9256690c3aa302508d5c3bdf0f609f7d2f1a8f1eec35633f815608fa8672b5a0"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/1.0.31/lizr_linux_arm64"
      sha256 "300a6e1379ee6ad72bd6c10b8583fe73305dda8b8a44cacc28a86efb3c4e7f4b"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.31/lizr_linux_amd64"
      sha256 "6557a97d54d0093b2e8b37ca49948f3be255ab0d3aedb4cd462d4a572083a215"
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
