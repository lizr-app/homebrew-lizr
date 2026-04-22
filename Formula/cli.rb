class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.11"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "52d8918a6601264ee040309283d9c8e83eafda9142a47650dfa2f68af4697692"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "a0adeb8e3bd3957d3e2e355cc81e5eabcf35ec92b69a7a67c6e13798b75f66f7"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "fc5ff10f060a428e95b4ba3c322c377af49082fe5b3eb135acf4e460b0ce9728"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "4c611c3448b6e536eb1b5560e022b30662b5a7bc52809e9658b26cdd500c19c6"
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
