class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.28.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.28.0/stashbase-0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "66f4d799185aad12e70ddab7260db61c9e0d4a07779c5a8747a2dd707bff2fb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.28.0/stashbase-0.28.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be7cd27c334db09cb07d2da8cbf7735fe76087f021165d8c029076d7fbbc6f87"
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
