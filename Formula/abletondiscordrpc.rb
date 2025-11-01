class Abletondiscordrpc < Formula
  desc "Discord Rich Presence for Ableton Live"
  homepage "https://github.com/seanhalberthal/abletondiscordrpc"
  url "https://github.com/seanhalberthal/abletondiscordrpc/releases/download/v1.7.1/arpc"
  version "1.7.1"
  sha256 "9cf5b5c87c03f4c0804e6bd9775b22375c6b3d68c767ab892e1cac050484cd91"
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
