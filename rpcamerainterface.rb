class Rpcamerainterface < Formula
   desc "Portable and unified interface for cameras."
   homepage "https://github.com/RandomPrototypes/RPCameraInterface"
   url "https://github.com/RandomPrototypes/RPCameraInterface/archive/refs/tags/v1.1.0-release.tar.gz"
   sha256 "c8a0fb6a70de47d6b97751fb74db86f24a9bd8362844ab860e4b40b3957452b9"
   license "ApacheV2"
   version "1.1.0"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "ffmpeg"
   depends_on "opencv"

   def install
      args = std_cmake_args
      args << "-DUSE_OPENCV=ON"
      args << "-DBUILD_DEMO=ON"
      system "cmake", ".", *args
      system "make", "install"
   end
end
