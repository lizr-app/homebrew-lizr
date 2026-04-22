class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.9"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "8d740136c0c1e8660e978e3e138658213495e58dae04c59f3ecaa29f7d73346c"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "2f8bbf4f6b20369fc1138655ca159f3c7aa278cafae5516fe616f3cd3bc4cb8d"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "c887797a5b882936ba3dd8fede0ee39e57c7f8ea1eb5e154c443f786d9383513"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "b081adb90ae844250254d4864a5038855b0b6d9b52439d9bad39633305920170"
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
