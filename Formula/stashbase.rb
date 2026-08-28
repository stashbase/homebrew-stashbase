class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.12.0/stashbase-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "52ed47817554c70c14dd09fca43ae5a856e081e06d9db4e86ea85d28347ca84a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.12.0/stashbase-0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec9b3857fe728ad1b408e2f1cf2ece2ecc8f87848b59a02b39235927dcc60a12"
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
