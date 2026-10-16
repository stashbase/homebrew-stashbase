class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.21.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.21.0/stashbase-0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "967a4c1b858f1422b997b2b7f926ac1d8423717f95231e3a2211b2665bd69061"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.21.0/stashbase-0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bca41a6a401799b52fe99a9ec1c3f3132d59e67bab58c3c8c3e67547fab8287c"
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
