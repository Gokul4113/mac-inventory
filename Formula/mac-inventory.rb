# typed: false
# frozen_string_literal: true

# Homebrew formula for mac-inventory
#
# SETUP INSTRUCTIONS (for the maintainer):
# 1. Push the mac-inventory repo to GitHub
# 2. Create a release tag:
#      git tag -a v1.0.0 -m "Initial release"
#      git push origin v1.0.0
# 3. Get the tarball URL:
#      https://github.com/Gokul4113/mac-inventory/archive/refs/tags/v1.0.0.tar.gz
# 4. Generate the SHA256:
#      curl -sL <tarball_url> | shasum -a 256
# 5. Replace the url and sha256 below
# 6. Copy this formula into your tap repo:
#      homebrew-mac-inventory/Formula/mac-inventory.rb

class MacInventory < Formula
  desc "Collect macOS software inventory into a single JSON file using osquery"
  homepage "https://github.com/Gokul4113/mac-inventory"

  # ── Replace these after creating a GitHub release ──────────────────────────
  url "https://github.com/Gokul4113/mac-inventory/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bca6b26cd235026e3b9dadbdcc142811803927292ab0002c65a11277a8f99072"
  # ──────────────────────────────────────────────────────────────────────────

  version "1.0.0"
  license "MIT"

  depends_on "osquery"
  depends_on "jq"

  def install
    bin.install "bin/mac-inventory"
  end

  test do
    assert_match "mac-inventory #{version}", shell_output("#{bin}/mac-inventory --version")
  end
end
