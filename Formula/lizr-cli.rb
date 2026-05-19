class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.75"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.75/lizr_darwin_arm64"
      sha256 "147509240706bec79193f2d984bae5204e487653b4ca08211a1f4212c38f7955"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.75/lizr_darwin_amd64"
      sha256 "28b59c9f2aab446a7894a97503c258e53c8a294d44a4e0536df1a70e840e7b41"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.75/lizr_linux_arm64"
      sha256 "46b8f0347ce8439afec588532185004bcfdeaffdec3248ce004535600947348e"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.75/lizr_linux_amd64"
      sha256 "d6ac5aefce1e826757fc785e893c60882f4a6a15e0fee00c50f91a9f0494435e"
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
