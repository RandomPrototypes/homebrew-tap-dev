class Rpmixedrealitycapture < Formula
   desc "Mixed reality capture software for quest 2"
   homepage "https://github.com/RandomPrototypes/RPMixedRealityCapture"
   url ""
   sha256 ""
   license "GPLV2"
   version "1.0.0"

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
