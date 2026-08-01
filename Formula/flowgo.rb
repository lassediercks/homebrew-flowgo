class Flowgo < Formula
  desc "Browser-based mind-map editor backed by a plain-text file"
  homepage "https://github.com/lassediercks/flowgo"
  version "0.1.9"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-arm64"
      sha256 "b3790290b9ca7971778ec00c64e02f4491703f4d0011f6897af330e439de0f1c"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-amd64"
      sha256 "9810f58c73892ef8ebe3edef7e9e7c74502f7c4f6a1381346decc22fc08bab7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-arm64"
      sha256 "73b5c40ce1209feba3ca6c97c15f8da1f847e67eb80c4b27e88fb40e442734bb"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-amd64"
      sha256 "2f3226291aa6269f86338117e19fb3f30685dcacabbb754c39b83bb340ae9e5c"
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
