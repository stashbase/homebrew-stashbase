class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.12.1/stashbase-0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "6a41e78c2b2345434eadbf77b6e0441752eb94e1ff8688825db3e327b860b7b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.12.1/stashbase-0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "27be8b802f52ae451c2861ff99deff1d7125e604572cfc10fa72ecf412157ce2"
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
