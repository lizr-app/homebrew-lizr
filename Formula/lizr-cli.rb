class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.37"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.37/lizr_darwin_arm64"
      sha256 "e4fa4f919f90d44a91e9a00bf377da4c73507d499f055497b817c6fea1fba58e"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.37/lizr_darwin_amd64"
      sha256 "baaeb013eea275804d317db558ced6fa7c4d3faba74415a075b1d8a73b280b22"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.37/lizr_linux_arm64"
      sha256 "0df6844e90a02e858868f30579ab38402f7c9acb011050e79f3d6fea588a5059"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.37/lizr_linux_amd64"
      sha256 "df800cdcb030085e93efefdafc218f9aa14bb0af37f184bb9cb6697bc52619a2"
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
