class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.15.0/stashbase-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "ed08c74ef6ca20dcf57fb662f9d3442dfcd365f6baf66809d4625b616fa92930"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.15.0/stashbase-0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d09a44b1674c680046b32f2007383b2f30e6ac3c5c980383baad95a72f5c5d7f"
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
