class DockerConnector < Formula
  desc "Provides the ability for the mac computer to directly access the docker container"
  homepage "https://github.com/wenjunxiao/mac-docker-connector"
  url "https://github.com/wenjunxiao/mac-docker-connector/releases/download/v1.0/docker-connector-mac.tar.gz"
  sha256 "a373cf08193fe7f71e8e0a335e1ef1f8062c12b5e4d0c4edb50709d5366bf7f7"
  version "1.0"
  def install
    bin.install "docker-connector"
    (buildpath/"options.cnf").write `docker network ls --filter driver=bridge --format "{{.ID}}" | xargs docker network inspect --format "route {{range .IPAM.Config}}{{.Subnet}}{{end}}"`
    etc.install "options.conf" => "docker-connector.conf"
  end
  plist_options :manual => "docker-connector #{HOMEBREW_PREFIX}/etc/docker-connector.conf"
  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <dict>
            <key>SuccessfulExit</key>
            <false/>
          </dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/redis-server</string>
            <string>-config</string>
            <string>#{etc}/docker-connector.conf</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/docker-connector.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/docker-connector.log</string>
        </dict>
      </plist>
    EOS
  end
end