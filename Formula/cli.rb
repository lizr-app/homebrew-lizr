class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.22"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "61c143a072c989e57fb09a646489215204b2896ed6b0e8d6413c8ca08cf39409"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "f1b4cc7ebfe99f21b8fe359ee5cce9570b5681db1e2f1c427e11ca689ec08b3a"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "95b56126090a1c66d08eca93fc48d76607bb58156592827cf3b23857c3f3f6fa"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "8ffce08326a0f88bec52c0528a3af0f16fc091841466e2cb5b24825a8736edff"
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
