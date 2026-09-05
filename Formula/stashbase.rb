class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.14.0/stashbase-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "d21362b48493166cc1c049a7323c168eabb64e6a671c2caa7c68acdf60410004"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.14.0/stashbase-0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e90d9144d386a48bf5abe45c0dec051c4938d96bdf0b2c57fb08c1aac3d2943c"
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
