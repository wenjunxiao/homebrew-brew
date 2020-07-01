class DockerAccessor < Formula
  desc "Provides the ability to access access the docker container of mac computer"
  homepage "https://github.com/wenjunxiao/mac-docker-connector/tree/master/accessor"
  url "https://github.com/wenjunxiao/mac-docker-connector/releases/download/v2.0/docker-accessor-darwin.tar.gz"
  sha256 "8a3ce874a7245235d67f3ba53b3fdecadee8b252ac38e980faa25c55e873d330"
  version "2.0"
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