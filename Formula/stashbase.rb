class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.20.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.20.0/stashbase-0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "508f806bfffe307dcb0679b724ece6a01616ce191cc0dc98b5843e55c02f657c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.20.0/stashbase-0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4a574a5717dbfcf90dec935af6e975e3844f598bac5550642ee36f1be889c13"
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
