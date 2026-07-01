class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.5.0/stashbase-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "9d059714449bfaf843745722ed0dd7c7d0dab52582080f1db5c3d18180706041"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.5.0/stashbase-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d908ee318567941e02277e4cbbf1ffc306e278c15158d5236ff13f877ea1971"
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
