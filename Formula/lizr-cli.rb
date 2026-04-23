class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.29"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/1.0.29/lizr_darwin_arm64"
      sha256 "0ee04bd9d063029a1d90f50101a5aeeca412a884349794be104909cdc99b7485"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.29/lizr_darwin_amd64"
      sha256 "4c364ffd5010354480791c21e673d412e0ea158e497bf7376d3c8e346a9e3ab4"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/1.0.29/lizr_linux_arm64"
      sha256 "8c279fc27a569555ab754becd6a46c96c3b0907ba40b80c7e8f73d16429bcf71"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.29/lizr_linux_amd64"
      sha256 "0a2108725a94fb236b6c937c9e9c20dd0726991f24b612f108dd80d43f5c03ab"
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
