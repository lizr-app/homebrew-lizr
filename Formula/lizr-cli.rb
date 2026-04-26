class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.35"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.35/lizr_darwin_arm64"
      sha256 "17e1843e478319162777bd803e31f978523a89a9dd22fcc97d0fd9663448af96"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.35/lizr_darwin_amd64"
      sha256 "66ff4bbf8d3dccbace95601cbaa58b749f8175b4587c459e2f0a419e45fe61d7"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.35/lizr_linux_arm64"
      sha256 "cdae33ee3f5f02a48cee2b96fd70d98e18bc05392401cc2c2ad38db159462fc9"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.35/lizr_linux_amd64"
      sha256 "107f169e4d4213ba16423b26ea64734b234e8a603936b7d97ef20022114b3c7e"
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
