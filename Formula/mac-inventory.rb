# typed: false
# frozen_string_literal: true

class MacInventory < Formula
  desc "Collect macOS software inventory into a single JSON file using osquery"
  homepage "https://github.com/Gokul4113/mac-inventory"
  url "https://github.com/Gokul4113/mac-inventory/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "2584e0221626df1b9bdabdaa4945581e54285f48c079a9f44c355de4f3752c67"
  version "1.2.0"
  license "MIT"

  depends_on "jq"
  depends_on "python@3"

  def install
    bin.install "bin/mac-inventory"
    bin.install "bin/mac-analyze"
  end

  def caveats
    <<~EOS
      mac-inventory requires osquery, which is available as a cask:
        brew install --cask osquery

      For vulnerability scanning (--scan), set your NVD API key:
        echo 'NVD_API_KEY=your_key_here' > ~/.mac-inventory.env
      Get a free key at: https://nvd.nist.gov/developers/request-an-api-key
    EOS
  end

  test do
    assert_match "mac-inventory #{version}", shell_output("#{bin}/mac-inventory --version")
  end
end

