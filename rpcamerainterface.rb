class Rpcamerainterface < Formula
   desc "Portable and unified interface for cameras."
   homepage "https://github.com/RandomPrototypes/RPCameraInterface"
   url "https://github.com/RandomPrototypes/RPCameraInterface/archive/refs/tags/v1.2.0-dev-3.tar.gz"
   sha256 "5dd4f085d6c1a50ca161057243839ca46073cfa1a6d8958670870924db6f6ec6"
   license "ApacheV2"
   version "1.2.0"
   
   option "with-gstreamer", "Use gstreamer backend"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "gstreamer" if build.with?('gstreamer')
   depends_on "gst-plugins-base"  if build.with?('gstreamer')
   depends_on "gst-plugins-good"  if build.with?('gstreamer')
   depends_on "gst-plugins-bad"  if build.with?('gstreamer')
   depends_on "ffmpeg"
   depends_on "opencv"

   def install
      args = std_cmake_args
      args << "-DUSE_OPENCV=ON"
      args << "-DBUILD_DEMO=ON"
      args << "-DUSE_GSTREAMER=ON" if build.with?('gstreamer')
      args << "-DUSE_GSTREAMER=OFF" if !build.with?('gstreamer')
      system "cmake", ".", *args
      system "make", "install"
   end
end
