# typed: false
# frozen_string_literal: true

class MacInventory < Formula
  desc "Collect macOS software inventory into a single JSON file using osquery"
  homepage "https://github.com/Gokul4113/mac-inventory"
  url "https://github.com/Gokul4113/mac-inventory/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bca6b26cd235026e3b9dadbdcc142811803927292ab0002c65a11277a8f99072"
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
