class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.13.0/stashbase-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "7f58168d90259514a71ace934a6c3076f88ab840765638db0bc1a931e627cf07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.13.0/stashbase-0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e68f8ac6f6f0c12d6f3b01db2b442712115f33b643f0f42aa6e6b3254d438472"
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
