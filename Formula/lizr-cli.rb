class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.38"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.38/lizr_darwin_arm64"
      sha256 "2fd0844d6d283fe0d985ba6e5bfc52e45d412bf5db4d54159d2857a25e0704f7"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.38/lizr_darwin_amd64"
      sha256 "e99b4fa79e38d4e09278dc0bb077df391f8dd0ee1879b945932ce7bf0e77d27a"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.38/lizr_linux_arm64"
      sha256 "b5af69f5d2cfeeb4a29a0df706c08024a1da3d9119f88e177e8724c7768c7cf6"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.38/lizr_linux_amd64"
      sha256 "df76208f5db613380baa9e4b2219f1c49ca757998cb4777e6edff48bbe5e94df"
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
