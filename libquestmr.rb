class Libquestmr < Formula
   desc "Mixed reality library for quest 2"
   homepage "https://github.com/RandomPrototypes/libQuestMR"
   url "https://github.com/RandomPrototypes/libQuestMR/archive/refs/tags/v1.0.0-release.2.tar.gz"
   sha256 "08881ddfb92231cc33dfdd4de32d7c076b2ea2a995599b88c8ea6ec482535ae6"
   license "GPLV2"
   version "1.0.0"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "rpcamerainterface"
   depends_on "ffmpeg"
   depends_on "opencv"
   depends_on "onnxruntime"

   def install
      args = std_cmake_args
      args << "-DUSE_OPENCV=ON"
      args << "-DBUILD_DEMO=ON"
      args << "-DUSE_RPCameraInterface=ON"
      args << "-DUSE_FFMPEG=ON"
      args << "-DUSE_ONNX_RUNTIME=ON"
      args << "-DONNX_RUNTIME_SESSION_INCLUDE_DIRS=#{Formula["onnxruntime"].include}/onnxruntime/core/session"
      system "cmake", ".", *args
      system "make", "install"
   end
end
