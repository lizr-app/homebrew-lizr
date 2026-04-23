class Cli < Formula
  desc "Selective routing proxy for AI and geo-locked services"
  homepage "https://lizr.app"
  license "Proprietary"
  version "1.0.24"

  on_macos do
    on_arm do
      url "https://get.lizr.app/dl/lizr_darwin_arm64"
      sha256 "da4a79a56d31e4036c8af53bf6cfbbdb70ea8f20ed52f5fc2d42da6597c86bc7"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_darwin_amd64"
      sha256 "b49de170a986d9cd3fa2a5529f2543f1a30b55ae8a5a742bc7708ea4041a1de8"
    end
  end

  on_linux do
    on_arm do
      url "https://get.lizr.app/dl/lizr_linux_arm64"
      sha256 "fe44f8501524415f1a926b7e849074abab19ebfdde487e74bc11ca156443ce1f"
    end
    on_intel do
      url "https://get.lizr.app/dl/lizr_linux_amd64"
      sha256 "865fe8abf6e7d5170711c457d1cc6d5cdf1a53c4116af55e9f4e02a4ac7ce720"
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
