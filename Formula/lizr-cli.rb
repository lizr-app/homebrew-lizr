class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.74"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.74/lizr_darwin_arm64"
      sha256 "a6d44307bbc5c37a8e5948d765be885409c2cd0f3d0ff8bd2039793404535628"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.74/lizr_darwin_amd64"
      sha256 "681c3657d956b4c38ef216e0c624d3a47fbd87abd3f71d036566ec3b15f19318"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.74/lizr_linux_arm64"
      sha256 "64d2c1e213f71611348ed89e6011fc5aac06c1ff65ab66bbe3e8865fa5444b15"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.74/lizr_linux_amd64"
      sha256 "bef278945fdc8086b3c2e665b37715646e0e4bb65bdc5ba46df33719d82f095c"
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
