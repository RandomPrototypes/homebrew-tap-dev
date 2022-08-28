class BufferedSocket < Formula
   desc "A multiplatform library for socket communication with buffering"
   homepage "https://github.com/RandomPrototypes/BufferedSocket"
   url "https://github.com/RandomPrototypes/BufferedSocket/archive/refs/tags/v0.1.tar.gz"
   sha256 "cd695a9717bb66e3c3eddb120a819984eaf729ce3fab0dee4e878f4e4c7252f0"
   license "ApacheV2"
   version "0.1"

   depends_on "cmake" => :build

   def install
      system "cmake", ".", *std_cmake_args
   end
end
