class Stashbase < Formula
  desc "The official Stashbase CLI"
  homepage "https://stashbase.dev"
  version "0.14.1"

  on_macos do
    on_arm do
      url "https://github.com/stashbase/cli/releases/download/v0.14.1/stashbase-0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "dd6956e0c31649e926e8118419d176d623b9f91e90eaffa9dd1288ecba5f10f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/stashbase/cli/releases/download/v0.14.1/stashbase-0.14.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "354808001da86f7d92d607202f117894e4e72864f36baa83aeb5387830796a25"
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
