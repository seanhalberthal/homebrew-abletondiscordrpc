class Abletondiscordrpc < Formula
  desc "Discord Rich Presence for Ableton Live"
  homepage "https://github.com/seanhalberthal/abletondiscordrpc"
  url "https://github.com/seanhalberthal/abletondiscordrpc/releases/download/v1.6.0/arpc"
  version "1.6.0"
  sha256 "7ff4777b78b782e343c7998846773b4d9b7bd13a3311c86c55d1ad54e5b8e9ea"
  license "MIT"

  def install
    bin.install "arpc"
  end

  def caveats
    <<~EOS
      To run arpc in the background:
        brew services start abletondiscordrpc

      Or run manually:
        arpc
    EOS
  end

  service do
    run opt_bin/"arpc"
    keep_alive true
    log_path var/"log/abletondiscordrpc.log"
    error_log_path var/"log/abletondiscordrpc.log"
  end

  test do
    assert_predicate bin/"arpc", :exist?
    assert_predicate bin/"arpc", :executable?
  end
end
