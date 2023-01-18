class ScreenCaptureLite < Formula
   desc "Cross-platform screen and window capturing library"
   homepage "https://github.com/smasherprog/screen_capture_lite"
   url "https://github.com/RandomPrototypes/screen_capture_lite/archive/refs/tags/17.1.613-dev-1.zip"
   sha256 "a90c4b8b68157f637c814da6312c4844020d349e2da9af13c89ed011aec8302c"
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
