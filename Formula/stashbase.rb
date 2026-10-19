class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.22.0/stashbase-0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "9a24ed213203c6be83efd30b4667db789b2547f62fa76bc3e492f54773169e2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.22.0/stashbase-0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4eb5d47f576d36dba9aeda02ce79c07b900ed119bbcd4752095139c75e36274e"
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
