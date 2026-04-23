class LizrCli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.28"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/1.0.28/lizr_darwin_arm64"
      sha256 "1fe8d698e5a0c1ff806e1c6c95fbd4759102224a3eb22b98f530b28b6cf11561"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.28/lizr_darwin_amd64"
      sha256 "9ac0f88e7f90f0cf8e036230c248c067b53d0d16d23bc0d20fea6e9cea7b2b49"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/1.0.28/lizr_linux_arm64"
      sha256 "3866c49ce7f14ddb7dfee240f1a7b4571b6d85ebd9ccb90f02962fdaaf73b4cd"
    end
    on_intel do
      url "https://get.lizr.app/dl/1.0.28/lizr_linux_amd64"
      sha256 "08db66f40b9c2945ede00a29792c21a958e9f93f42849f95cc0a174dd662ad55"
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
