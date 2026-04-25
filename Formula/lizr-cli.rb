class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.30"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/1.0.30/lizr_darwin_arm64"
      sha256 "0112a66710ac57a928af13881fd45dee20766275ea18ad42f8fbafc62d67b79f"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.30/lizr_darwin_amd64"
      sha256 "742e777f845cfc3fc1931d36fba6dc26fe4675ea9a703d8153d9b35e9d178c45"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/1.0.30/lizr_linux_arm64"
      sha256 "b6fa2a3c4ac6f8342245c20e522c588153123e5c71077b467cc2faf52f19baf5"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.30/lizr_linux_amd64"
      sha256 "1fe275868be2762b93cbb5771c416db9536d002b91b648b1b169aa44aa140cd1"
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
