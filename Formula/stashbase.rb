class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.7.1/stashbase-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "d90963815340c99b2b3a869f187602ef19d0e4ae72808904cc8c8fd1f229a560"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.7.1/stashbase-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6594304a2cdbc72aa9fe2855f968eebb465aeaeb8a844d65b7095d672a319f97"
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
