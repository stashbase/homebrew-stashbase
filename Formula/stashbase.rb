class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.9.1/stashbase-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "63cfdb554966f47d9bcf1e31e1f0455d099123e6a56cf02efd6bbb072659a6ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.9.1/stashbase-0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae67e893025e47a26760031cb578cd82118b7c733749c2bb258fb0b7ae0d18f4"
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
