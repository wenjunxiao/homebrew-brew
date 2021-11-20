class DockerAccessor < Formula
  desc "Provides the ability to access access the docker container of mac computer"
  homepage "https://github.com/wenjunxiao/mac-docker-connector/tree/master/accessor"
  url "https://github.com/wenjunxiao/mac-docker-connector/releases/download/v3.0/docker-accessor-darwin.tar.gz"
  sha256 "8a5326d08552104c9a75888fc831353bfc830f5b8d92ec6eb7d9174881446824"
  version "3.0"
  def install
    bin.install "docker-accessor"
  end
  def caveats
    <<~EOS
    First, you should get `docker-connector`'s address and the token assigned to you by other, who expose the docker container to you.
    You can connect to docker-connector by follow command:
      docker-accessor -remote address -token you-token
    EOS
  end
end