class DockerAccessor < Formula
  desc "Provides the ability to access access the docker container of mac computer"
  homepage "https://github.com/wenjunxiao/mac-docker-connector/tree/master/accessor"
  url "https://github.com/wenjunxiao/mac-docker-connector/releases/download/v3.1/docker-accessor-darwin.tar.gz"
  sha256 "9e58ef987a05d9ef82850261ea3fa5253714b0191c72cff5682c7e9ed448a2a3"
  version "3.1"
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