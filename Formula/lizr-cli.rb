class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.76"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.76/lizr_darwin_arm64"
      sha256 "7a389ccec6ae056b0725993823266a70e4f7f0273eeace00d8d147cbd41c11a5"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.76/lizr_darwin_amd64"
      sha256 "8e5d6d39ad3a5af76cb43087b348e156702e24ca5e51393252cf1d38740b4466"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.76/lizr_linux_arm64"
      sha256 "332df1122e903565c041ec6b5b080c8df85430c062baf70626a63f71a1b00d5b"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.76/lizr_linux_amd64"
      sha256 "f4b6c959e683890bf228412b2c7c475c6a748e27961b76eafa3fac84f09b65e2"
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
