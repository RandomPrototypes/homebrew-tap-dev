class Libquestmr < Formula
   desc "Mixed reality library for quest 2"
   homepage "https://github.com/RandomPrototypes/libQuestMR"
   url "https://github.com/RandomPrototypes/libQuestMR/archive/refs/tags/v1.1.0-dev-2.tar.gz"
   sha256 "fafacd976dd2e308411deb3a690e07b3bdc45504f865e4a56d92fc839cb16ccb"
   license "GPLV2"
   version "1.1.0"

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
      args << "-DBUILD_DEMO=OFF"
      args << "-DUSE_RPCameraInterface=ON"
      args << "-DUSE_FFMPEG=ON"
      args << "-DUSE_ONNX_RUNTIME=ON"
      args << "-DONNX_RUNTIME_SESSION_INCLUDE_DIRS=#{Formula["onnxruntime"].include}/onnxruntime/core/session"
      system "cmake", "-B", "build_lib" , ".", *args
      system "cmake", "--build", "build_lib"
      system "cmake", "--install", "build_lib"
      args2 = std_cmake_args
      system "cmake", "-B", "build_app", "demo", *args2
      system "cmake", "--build", "build_app"
      system "cmake", "--install", "build_app"
   end
end
