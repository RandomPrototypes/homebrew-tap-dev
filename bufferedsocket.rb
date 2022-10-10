class Bufferedsocket < Formula
   desc "A multiplatform library for socket communication with buffering"
   homepage "https://github.com/RandomPrototypes/BufferedSocket"
   url "https://github.com/RandomPrototypes/BufferedSocket/archive/refs/tags/v1.1.3-dev.tar.gz"
   sha256 "bbc168588bef210a69612c34779b032c92021da80051b7d04be83b6f3b5f013c"
   license "ApacheV2"
   version "1.1.3"

   depends_on "cmake" => :build

   def install
      args = std_cmake_args
      args << "-DUSE_POLL_INSTEAD_OF_SELECT=ON"
      system "cmake", ".", *args
      system "make", "install"
   end
end
