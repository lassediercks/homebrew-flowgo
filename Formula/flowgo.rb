class Flowgo < Formula
  desc "Browser-based mind-map editor backed by a plain-text file"
  homepage "https://github.com/lassediercks/flowgo"
  version "0.1.7"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-arm64"
      sha256 "fa1b673fef064d87111c12e8bbb9ae992f803c68fdbf2bb29d4e3c2cf2476688"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-amd64"
      sha256 "8a9ecf8477957b627e33b9bdfc72a0c21b72b6e3e65559c5d140eb8a0c75b8d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-arm64"
      sha256 "c0254c256906a8aabbf5552f41dd3cd561c7078e154694d6b444e5da737735dc"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-amd64"
      sha256 "32c1ed2e980556f404152d2557697cd42b4b956436fa2333bbf5d05919ab0059"
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
