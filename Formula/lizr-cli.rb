class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.27"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/1.0.27/lizr_darwin_arm64"
      sha256 "389b24b0a50ad443b36e80b093ebcc109d58c75b50a020ab8d9ea4e8b88b77ce"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.27/lizr_darwin_amd64"
      sha256 "305e3b4ce2919245eb1ce4906da5f1f7fc8bed4a065fbbc5089031081e611271"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/1.0.27/lizr_linux_arm64"
      sha256 "a01520b161730016588410e4051deb9cc52bd6b6d111276cf7b67fa56b138a71"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.27/lizr_linux_amd64"
      sha256 "89a4fc40c01bf97df7dc44f8980bfc8f661a2c1e4494e76589baaeed561d4923"
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
