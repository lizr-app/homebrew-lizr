class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.23"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "9a007ed3675acfea1237b42210f2bbbaa160db67b6f3fc5cd0a2cf01a3a2b33f"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "d7638d9e20f1144d3420313b5b7fa654362d0e92277e47dd54c44d0559daf098"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "297c418bc6ce336082b4097e56fb49e36122d4bbcc9bd03a45ebce70a52fb6a3"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "73d173851e71ab2a146918ca135a446fa3ab34244d0095e86a8026f18e521d4b"
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
