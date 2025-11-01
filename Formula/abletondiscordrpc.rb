class Abletondiscordrpc < Formula
  desc "Discord Rich Presence for Ableton Live"
  homepage "https://github.com/seanhalberthal/abletondiscordrpc"
  url "https://github.com/seanhalberthal/abletondiscordrpc/releases/download/v1.7.0/arpc"
  version "1.7.0"
  sha256 "7ac914b91f47231a5951888a7f9ec5ffa8ad2cdd4f15a984630da82d357c540b"
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
