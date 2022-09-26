class Bufferedsocket < Formula
   desc "A multiplatform library for socket communication with buffering"
   homepage "https://github.com/RandomPrototypes/BufferedSocket"
   url "https://github.com/RandomPrototypes/BufferedSocket/archive/refs/tags/v1.1.2-dev.tar.gz"
   sha256 "11dedef67ef5d3459c76ad0277c215363eaceb43c89e2aac55882fa998a3807a"
   license "ApacheV2"
   version "1.1.2"

   depends_on "cmake" => :build

   def install
      args = std_cmake_args
      args << "-DUSE_POLL_INSTEAD_OF_SELECT=ON"
      system "cmake", ".", *args
      system "make", "install"
   end
end
