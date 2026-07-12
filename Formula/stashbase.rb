class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.6.1/stashbase-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "063e98bed16dbba534dec062910b5ca08b6a403e35dc98bfcad6038cf213d7f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.6.1/stashbase-0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ccfcabfec80336431988b12c3bb6b157c4b9999403cb4f5994172af68e41a28b"
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
