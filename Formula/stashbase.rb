class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.8.0/stashbase-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "ff084af1010260dc2766289f902c0530cb30609289ffc9dea8c27fb0fb6b576d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.8.0/stashbase-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73c887c9f8b877fa4d5475336878ee885c774f42a776b215adc1319e3a6ddcf0"
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
