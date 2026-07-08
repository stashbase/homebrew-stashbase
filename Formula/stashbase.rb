class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.6.0/stashbase-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "0253a5784b051ec11b49b9721b02b3207f5174392d3cdadae7d468e8fff9f514"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.6.0/stashbase-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1a610eccda10f4731413489158574baefc03125325186a9ca9286b0d392f9652"
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
