class Rpmixedrealitycapture < Formula
   desc "Mixed reality capture software for quest 2"
   homepage "https://github.com/RandomPrototypes/RPMixedRealityCapture"
   url "https://github.com/RandomPrototypes/RPMixedRealityCapture/archive/refs/tags/v1.2.0-dev.tar.gz"
   sha256 "157cc9a62614b48f5aec793bd3a6d43f239c9bba4acd4b86634723ea21870fdc"
   license "GPLV2"
   version "1.2.0"

   depends_on "cmake" => :build
   depends_on "pkg-config" => :build
   depends_on "bufferedsocket"
   depends_on "rpcamerainterface"
   depends_on "libquestmr"
   depends_on "qt@5"

   def install
      args = std_cmake_args
      system "cmake", ".", *args
      system "make", "install"
   end
end
