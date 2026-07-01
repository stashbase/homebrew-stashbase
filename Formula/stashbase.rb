class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.5.0/stashbase-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "fdf4bd8d0fef0bfd78fc8744e5709f295da7cf7cd88c1c2ff8c0e3f839e6132a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.5.0/stashbase-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "27a11e2220bf876e1cf66b9c0a815bfbc814d3f08d444b80c62ad4ba507d4635"
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
