class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.23.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.23.0/stashbase-0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "be11328377075decada169d5e279af0c468b5412f1c1c5d87929e80c8eae6f0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.23.0/stashbase-0.23.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e78881a9685aa9c5d8610970a6dbd18b99e851f6d656910896c579312d2e49d3"
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
