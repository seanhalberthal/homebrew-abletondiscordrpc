class Abletondiscordrpc < Formula
  desc "Discord Rich Presence for Ableton Live"
  homepage "https://github.com/seanhalberthal/abletondiscordrpc"
  url "https://github.com/seanhalberthal/abletondiscordrpc/releases/download/v1.4.2/ableton-discord-rpc"
  version "1.4.2"
  sha256 "de06dfe89d8697fea93835f530ea9f61221666378f93d9554bc4725d152bb207"
  license "MIT"

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
