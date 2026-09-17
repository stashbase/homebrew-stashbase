class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.16.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.16.0/stashbase-0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "7165ef16e7263820c08d9f42330fad5d72f83aa9800e4de029e1d4cdc6137ade"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.16.0/stashbase-0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f97ca982f161b2054de40e8c11ce3aa5fbb60a399ae77da17d4ccda486d34d08"
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
