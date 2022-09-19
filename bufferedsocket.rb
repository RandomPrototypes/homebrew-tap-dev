class Bufferedsocket < Formula
   desc "A multiplatform library for socket communication with buffering"
   homepage "https://github.com/RandomPrototypes/BufferedSocket"
   url "https://github.com/RandomPrototypes/BufferedSocket/archive/refs/tags/v1.1.0-dev.tar.gz"
   sha256 "78145f3cdcbf7ee4a6c48ef54e01c1bb5871c14d8d48af227ba5faea5fd6274f"
   license "ApacheV2"
   version "1.1.0"

   depends_on "cmake" => :build

   def install
      system "cmake", ".", *std_cmake_args
      system "make", "install"
   end
end
