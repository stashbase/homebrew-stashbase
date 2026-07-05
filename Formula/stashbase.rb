class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.5.1/stashbase-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "29443c8edb41e4f0e02e01cc50d78b4b7c1128f2cf1a0285064dfd93d8963901"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.5.1/stashbase-0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c38680cc5acf1102beebd307664eef3480ed1c70b9dacac3916eddfb36f74193"
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
