class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.11.0/stashbase-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "5388b5139ab7cd4bba21d0891b72dbb6b86d9ae2c581de1991f74a247486254d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.11.0/stashbase-0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "566896a6f614946b5a5725a1f2401ffedc9fda48bb26fff312c35eb28ed8e468"
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
