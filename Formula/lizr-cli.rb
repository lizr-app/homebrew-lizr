class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.77"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.77/lizr_darwin_arm64"
      sha256 "92cb46e241b17ebf799f3d5a3853da2a8254dc5f65e316d7e15dac4643eb290e"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.77/lizr_darwin_amd64"
      sha256 "728d4b2e5d2c64a1889ee3f76b5c41e95460b64655be0c4c11ee41ed869592c0"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.77/lizr_linux_arm64"
      sha256 "1d9982818e0334a039286298d9f5e7d64ced4eba46db6f57f39c6ea1b9e3c35d"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.77/lizr_linux_amd64"
      sha256 "76e22f128951a83ccdd48ba2235a104ba431917add27b23c0c03fd3731346d16"
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
