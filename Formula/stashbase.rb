class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.17.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.17.1/stashbase-0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "a200c633eb556ccce41ea001298f1d64b261bb8129916223b1d61956f156be33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.17.1/stashbase-0.17.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e73f6cea204de86e93a5811c4b5c81af9b18e0792d2b8f2b62c4dce3e28e2b22"
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
