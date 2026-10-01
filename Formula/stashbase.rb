class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.18.0/stashbase-0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "e6309eb9d608f001556e000109ab8c6821eda574fe582b077e4a6edd9e9d4706"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.18.0/stashbase-0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78f8e31588a52dff11ec970c9ddfbb4d7dd16c4742fb1dc190ac724d3adfbc4a"
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
