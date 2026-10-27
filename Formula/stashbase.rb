class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.24.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.24.0/stashbase-0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "d33afa017d676e94434e2d98b943b1b007c53cfec018cedfa64383429589a92e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.24.0/stashbase-0.24.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2c630f41924a44c216347571fe0eec82ca4461cffc9a3bbe56668c0554dc75ff"
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
