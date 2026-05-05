class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "0.0.36"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/0.0.36/lizr_darwin_arm64"
      sha256 "1c26d179d689b45891b96cedf868be2707fa68249a7530d518f83445afcd3d12"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.36/lizr_darwin_amd64"
      sha256 "0a666408a3f1491f78f234b436ce2a19734a0d2478cf047af7ed18d5f36608c0"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/0.0.36/lizr_linux_arm64"
      sha256 "d28082cfa44c16b7a112401f397dbc7ffa413098d8d50504f4f2be96cc131702"
    end
    on_intel do
      url "https://get.lizr.app/dl/0.0.36/lizr_linux_amd64"
      sha256 "8b55af298aa6b3da81b96e2fc4ead990f6a614ba1ac87be584173361408c4307"
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
