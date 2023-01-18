class Rpcamerainterface < Formula
   desc "Portable and unified interface for cameras."
   homepage "https://github.com/RandomPrototypes/RPCameraInterface"
   url "https://github.com/RandomPrototypes/RPCameraInterface/archive/refs/tags/v1.2.0-dev-5.zip"
   sha256 "2b3137693e4caefa2c37818bee828b4e3957382d1d0322f9613d288f582c625a"
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
   depends_on "screen_capture_lite"

   def install
      args = std_cmake_args
      args << "-DUSE_OPENCV=ON"
      args << "-DBUILD_DEMO=OFF"
      args << "-DUSE_GSTREAMER=ON" if build.with?('gstreamer')
      args << "-DUSE_GSTREAMER=OFF" if !build.with?('gstreamer')
      args << "-DUSE_SCREEN_CAPTURE_LITE=ON"
      system "cmake", "-B", "build_lib" , ".", *args
      system "cmake", "--build", "build_lib"
      system "cmake", "--install", "build_lib"
      args2 = std_cmake_args
      system "cmake", "-B", "build_app", "demo", *args2
      system "cmake", "--build", "build_app"
      system "cmake", "--install", "build_app"
   end
end
