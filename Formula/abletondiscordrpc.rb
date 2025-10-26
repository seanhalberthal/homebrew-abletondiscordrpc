class Abletondiscordrpc < Formula
  desc "Discord Rich Presence for Ableton Live"
  homepage "https://github.com/seanhalberthal/abletondiscordrpc"
  url "https://github.com/seanhalberthal/abletondiscordrpc/releases/download/v1.4.1/ableton-discord-rpc"
  version "1.4.1"
  sha256 "08d7813f3b730188dbce553cbba1c85b46cc7b3ebb422fdf692939bc9aa81c95"

  def install
    bin.install "ableton-discord-rpc"
  end

  def caveats
    <<~EOS
      To run abletondiscordrpc in the background:
        brew services start abletondiscordrpc

      Or run manually:
        abletondiscordrpc
    EOS
  end

  service do
    run opt_bin/"abletondiscordrpc"
    keep_alive true
    log_path var/"log/abletondiscordrpc.log"
    error_log_path var/"log/abletondiscordrpc.log"
  end

  test do
    assert_predicate bin/"abletondiscordrpc", :exist?
    assert_predicate bin/"abletondiscordrpc", :executable?
  end
end
