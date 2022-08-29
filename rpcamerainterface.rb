class Rpcamerainterface < Formula
   desc "Portable and unified interface for cameras."
   homepage "https://github.com/RandomPrototypes/RPCameraInterface"
   url "https://github.com/RandomPrototypes/RPCameraInterface/archive/refs/tags/v1.2.0-dev-1.tar.gz"
   sha256 "5f322cdba5b7b9d29a13a523d17f60c66ee4d80f54ff81828cadc962a70ae58e"
   license "ApacheV2"
   version "1.1.0"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "gstreamer"
   depends_on "gst-plugins-base"
   depends_on "gst-plugins-good"
   depends_on "gst-plugins-bad"
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
