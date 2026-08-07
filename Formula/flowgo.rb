class Flowgo < Formula
  desc "Browser-based mind-map editor backed by a plain-text file"
  homepage "https://github.com/lassediercks/flowgo"
  version "0.3.14"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-arm64"
      sha256 "e6de42f217e6597cd2ed076bc2676bc7a8d20af601ec30e4b1d8cd061b6b334c"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-amd64"
      sha256 "debc232c0b8b0577d20be7618052f135ff9c881e6e3b57772c616cec6ef5c723"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-arm64"
      sha256 "b751b5ecd5ef0057f3a55052bd975e74aed97147b74872cab8f9e3ada8748a11"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-amd64"
      sha256 "f604e11687035325d89a86109953d7c5bc4f0d57cb1cfa50d5ca64ba216ff654"
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
