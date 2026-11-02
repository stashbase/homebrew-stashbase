class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.26.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.26.0/stashbase-0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "3a87feec3e272ec0c3d2b3e1fcf7a9d479bcd11f73931c9aa440f1a8c1c8109e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.26.0/stashbase-0.26.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6c7ac83621e78d69447cee22ffd6b49f43d495494179c885ca20582e222a896e"
    end
  end

  def install
    bin.install "stashbase"

    # Install optional shell completions and manpage when shipped in the archive.
    bash_completion.install "completions/stashbase.bash" => "stashbase" if File.exist?("completions/stashbase.bash")
    zsh_completion.install "completions/stashbase.zsh" => "_stashbase" if File.exist?("completions/stashbase.zsh")
    fish_completion.install "completions/stashbase.fish" if File.exist?("completions/stashbase.fish")
    man1.install "manpages/stashbase.1.gz" if File.exist?("manpages/stashbase.1.gz")
  end
end
