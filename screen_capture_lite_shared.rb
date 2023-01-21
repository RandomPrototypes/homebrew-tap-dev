class ScreenCaptureLiteShared < Formula
   desc "Cross-platform screen and window capturing library"
   homepage "https://github.com/smasherprog/screen_capture_lite"
   url "https://github.com/RandomPrototypes/screen_capture_lite/archive/refs/tags/17.1.613-dev-2.zip"
   sha256 "a47f39172022f634ceac0be442648899c2f1953dc0b61da6919852867ff16e63"
   license "MIT"
   version "17.1.613"

   depends_on "cmake" => :build

   def install
      args = std_cmake_args
      args << "-DBUILD_CSHARP=OFF -DBUILD_EXAMPLE=OFF"
      system "cmake", "-B", "build_lib" , ".", *args
      system "cmake", "--build", "build_lib"
      system "cmake", "--install", "build_lib"
   end
end
