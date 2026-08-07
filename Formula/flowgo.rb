class Flowgo < Formula
  desc "Browser-based mind-map editor backed by a plain-text file"
  homepage "https://github.com/lassediercks/flowgo"
  version "0.3.12"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-arm64"
      sha256 "b27a68879208a83b984746e8f7d04a6af2d72d26196b6c4353aec30d845b06eb"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-amd64"
      sha256 "1047d83205614630fc93ead69ef12f763c8f3bc60bd375b35bef8a60deee20c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-arm64"
      sha256 "7e4eeb13816e99d6b05ef216ee4d0bbf8a091eb1fbe9acd1e29e4016a1c06044"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-amd64"
      sha256 "55ca67ec84d36db5861ea2145f708c074192638c790f830c60dd1575887d8a60"
    end
  end

  def install
    # Release assets are raw binaries (not tarballs) named flowgo-v{version}-{os}-{arch}.
    # Rename to "flowgo" so $HOMEBREW_PREFIX/bin gets a clean name.
    bin.install Dir["flowgo-*"].first => "flowgo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowgo version")
  end
end
