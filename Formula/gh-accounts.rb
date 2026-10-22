class GhAccounts < Formula
  desc "Per-client GitHub accounts for gh, git, SSH and GPG, auto-selected by folder"
  homepage "https://github.com/aiherrera/gh-accounts"
  url "https://github.com/aiherrera/gh-accounts/archive/e733ad6141cbfd1c4c497f784a8fd3ed9f66c2f4.tar.gz"
  version "1.0.1"
  sha256 "39994cbac980659c6e31e2663728566c27902073fba22b94507f58d421f5dc21"
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
