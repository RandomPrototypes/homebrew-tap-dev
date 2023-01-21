class Rpmixedrealitycapture < Formula
   desc "Mixed reality capture software for quest 2"
   homepage "https://github.com/RandomPrototypes/RPMixedRealityCapture"
   url "https://github.com/RandomPrototypes/RPMixedRealityCapture/archive/refs/tags/v1.2.0-dev-4.tar.gz"
   sha256 "ad1b4655cb1120f7d35087d2f0ad8e7872b83c0bc516cf0116c85b6a1939336d"
   license "GPLV2"
   version "1.2.4"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "rpcamerainterface"
   depends_on "libquestmr"
   depends_on "qt@5"
   
   resource "rvm_mobilenetv3_fp32" do
      url "https://github.com/PeterL1n/RobustVideoMatting/releases/download/v1.0.0/rvm_mobilenetv3_fp32.onnx"
      sha256 "88d4531297118f595bf2fd60f6f566aec2e559393802d1f436c380f0cbbd2828"
   end

   def install
      args = std_cmake_args
      system "cmake", ".", *args
      system "make"
      system "mkdir", "resources/backgroundSub_data"
      libexec.install "resources"
      resource("rvm_mobilenetv3_fp32").stage { (libexec/"resources/backgroundSub_data").install "rvm_mobilenetv3_fp32.onnx"}
      libexec.install "RPMixedRealityCapture"
      bin.write_exec_script(libexec/"RPMixedRealityCapture")
   end
end
