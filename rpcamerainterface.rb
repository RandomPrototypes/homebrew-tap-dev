class Rpcamerainterface < Formula
   desc "Portable and unified interface for cameras."
   homepage "https://github.com/RandomPrototypes/RPCameraInterface"
   url "https://github.com/RandomPrototypes/RPCameraInterface/archive/refs/tags/v1.2.0-dev-4.tar.gz"
   sha256 "a5889a71931d6829464d1509e0999c8ffea7aa0f87f308ab49002180acb92348"
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
      args << "-DBUILD_DEMO=OFF"
      args << "-DUSE_GSTREAMER=ON" if build.with?('gstreamer')
      args << "-DUSE_GSTREAMER=OFF" if !build.with?('gstreamer')
      system "cmake", "-B", "build_lib" , ".", *args
      system "cmake", "--build", "build_lib"
      system "cmake", "--install", "build_lib"
      args2 = std_cmake_args
      system "cmake", "-B", "build_app", "demo", *args2
      system "cmake", "--build", "build_app"
      system "cmake", "--install", "build_app"
   end
end
