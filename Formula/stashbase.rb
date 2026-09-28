class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.17.0/stashbase-0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "daa6144f35a77bb2ea63cfff903a9a7f4b8cb127cb7f0b5dc27f24ab86d8d5a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.17.0/stashbase-0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e60d7f669ca5754366408825d04f82e361fd42ecbc8239539c8dfa30fdce5421"
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
