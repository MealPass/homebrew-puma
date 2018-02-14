class PumaDev < Formula
  desc "A tool to manage rack apps in development with puma"
  homepage "https://github.com/puma/puma-dev"
  url "https://github.com/nonrational/puma-dev/files/1725546/puma-dev-v0.11.1-darwin-amd64.zip"
  sha256 "4a43771a77d7186102475992f77cd36188291ed6c1dc6eca63cbbf7bac5f6d42"
  version '0.11.1'

  def install
    bin.install "puma-dev"
  end

  test do
    require 'open3'
    puma_dev_bin = "#{bin}/puma-dev"
    ::Open3.popen3("#{puma_dev_bin} -h") do |_, _, stderr|
      assert_equal "Usage of #{puma_dev_bin}:", stderr.readlines.first.strip
    end
  end

  def caveats
    <<~EOS
      Setup dev domains:
        sudo puma-dev -setup

      Install puma-dev as a launchd agent (required for port 80 usage):
        puma-dev -install

      To update to the latest release:
        puma-dev -install
    EOS
  end
end

