class DockerConnector < Formula
  desc "Provides the ability for the mac computer to directly access the docker container"
  homepage "https://github.com/wenjunxiao/mac-docker-connector"
  url "https://github.com/wenjunxiao/mac-docker-connector/releases/download/v3.1/docker-connector-darwin.tar.gz"
  sha256 "b0e55ca06440644a1e943be7b9f5b02e5f19f6c52d59ffc3171bbb1292a07466"
  version "3.1"
  def install
    bin.install "docker-connector"
    (buildpath/"docker-connector.conf").write <<~EOS
      # addr 192.168.251.1/24
      # mtu 1400
      # host 127.0.0.1
      # port 2511
      # route 172.17.0.0/16
      # route 172.18.0.0/16
      # iptables 172.17.0.0+172.18.0.0
      # hosts /etc/hosts .local
      # proxy 127.0.0.1:80:80
    EOS
    etc.install "docker-connector.conf"
  end
  def caveats
    <<~EOS
    For the first time, you can add all the bridge networks of docker to the routing table by the following command:
      docker network ls --filter driver=bridge --format "{{.ID}}" | xargs docker network inspect --format "route {{range .IPAM.Config}}{{.Subnet}}{{end}}" >> #{HOMEBREW_PREFIX}/etc/docker-connector.conf
    Or add the route of network you want to access to following config file at any time:
      #{HOMEBREW_PREFIX}/etc/docker-connector.conf
    Route format is `route subnet`, such as:
      route 172.17.0.0/16
    The route modification will take effect immediately without restarting the service.
    You can also expose you docker container to other by follow settings in #{HOMEBREW_PREFIX}/etc/docker-connector.conf:
      expose 0.0.0.0:2512
      route 172.17.0.0/16 expose
    Let the two subnets access each other through iptables:
      iptables 172.17.0.0+172.18.0.0
    EOS
  end
  plist_options :startup => "true", :manual => "sudo docker-connector -config #{HOMEBREW_PREFIX}/etc/docker-connector.conf"
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
            <string>#{opt_bin}/docker-connector</string>
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