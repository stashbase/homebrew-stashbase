class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.27.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.27.0/stashbase-0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "10cec595d56537f59256386f1afac2e0bd996fde319ad6e748e58025767d14f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.27.0/stashbase-0.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a991e5a654e55e56f97f0220ace0416fb804c542a35278107abeb8b988371d06"
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
