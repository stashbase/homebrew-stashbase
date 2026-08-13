class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.9.0/stashbase-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "894080a778fee6e73101354e9418cc269f14bee61f5e5a2e24afcd3f27f85dd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.9.0/stashbase-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0f271eac3f9c97cd2f6356f34e57b1c907913bd8550f40e03eb941ad77a17779"
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
