class Flowgo < Formula
  desc "Browser-based mind-map editor backed by a plain-text file"
  homepage "https://github.com/lassediercks/flowgo"
  version "0.3.26"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-arm64"
      sha256 "da35f26b14d5a10ffb3777767ea99b06e653e5e94efc7a38d77ae838b09af07e"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-darwin-amd64"
      sha256 "15796c6c8cd7dfb33d9d19da79cb585f195073efe8b8f8f49710258df5f9bfb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-arm64"
      sha256 "a7b86c56e798f6809e6f7156444485b0cb6faf95452144840fb280ee016a4853"
    end
    on_intel do
      url "https://github.com/lassediercks/flowgo/releases/download/v#{version}/flowgo-v#{version}-linux-amd64"
      sha256 "476ae300ca87c6d9074b636b612f412de93af5cd6717dbec105647b75a88d9f6"
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
