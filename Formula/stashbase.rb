class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.19.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.19.8/stashbase-0.19.8-aarch64-apple-darwin.tar.gz"
      sha256 "a37e12549edb76500275bbb6c4be5f91084ec03660bbe4cd0d31cf1591f19e24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.19.8/stashbase-0.19.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e1dd7470d2fcf44f076d9da62b84036e9942b76bbfedb326a7588e096a6ea98"
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
