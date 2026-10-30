class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.25.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.25.0/stashbase-0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "e043efcc72f6aff63421b23c61f9f5c87997f661cd7eb3cd32ab3d90fad2b597"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.25.0/stashbase-0.25.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e40bbccdc0e4842efbadb0a847f3e0e575e7e7a9e0e4ae62667bf412dae73dc3"
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
