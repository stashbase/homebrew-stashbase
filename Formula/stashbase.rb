class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.7.0/stashbase-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "4b50c023613abfcb1188bfbf7deb0d639fa7850b716dd030dc9c7b10729bc37a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.7.0/stashbase-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6cc29075f4a6b625c102d93cbcefef1b9480dc553f98a64393d19febf8fc0d90"
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
