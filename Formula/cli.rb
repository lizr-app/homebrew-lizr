class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.13"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "c0e9969e3faecb1d4866b1a07972bab613473657109a99cf3c02d69b45636068"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "851f5c0215144f12ad21dbd1262610c65ab99e44a74fd9e47addbfc0e2b4cc4f"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "57d199fcd958676008cffca68b002654e2de829179518ef81f694d4feeca1ea0"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "21987eb3baac6e1b9c48ccb4875515f1902053560339d7e0f920264e46d459b3"
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
