class GhAccounts < Formula
  desc "Per-client GitHub accounts for gh, git, SSH and GPG, auto-selected by folder"
  homepage "https://github.com/aiherrera/gh-accounts"
  url "https://github.com/aiherrera/gh-accounts/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0ec61ad3752f78a5974976b80bd22ec1358b883e70c5f33f6f4950fefb5eaadc"
  license "MIT"

  depends_on "gh"

  def install
    bin.install "gh-accounts"
  end

  def caveats
    <<~EOS
      Run once to install the folder-aware gh wrapper and import existing setups:
        gh-accounts init

      Then add clients with:
        gh-accounts add

      For GPG-signed commits: brew install gnupg pinentry-mac
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-accounts version")
  end
end
