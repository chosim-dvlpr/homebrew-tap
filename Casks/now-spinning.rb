cask "now-spinning" do
  version "0.1.2"
  sha256 "98c2144e6cccd70a71c02f36ef7951bdc00dd3400027a7075e6c4fc6a1aa66b1"

  url "https://github.com/chosim-dvlpr/now-spinning/releases/download/v#{version}/NowSpinning.zip"
  name "NowSpinning"
  desc "Always-on-top spinning CD widget showing the current Spotify track with a live waveform"
  homepage "https://github.com/chosim-dvlpr/now-spinning"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "NowSpinning.app"

  # ad-hoc 서명이라 quarantine을 제거해야 Gatekeeper 경고 없이 실행됨
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/NowSpinning.app"]
  end

  uninstall quit: "io.github.chosim-dvlpr.NowSpinning"

  zap trash: "~/Library/Saved Application State/io.github.chosim-dvlpr.NowSpinning.savedState"
end
