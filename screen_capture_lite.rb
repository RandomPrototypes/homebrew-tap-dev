class ScreenCaptureLite < Formula
   desc "Cross-platform screen and window capturing library"
   homepage "https://github.com/smasherprog/screen_capture_lite"
   url "https://github.com/smasherprog/screen_capture_lite/archive/refs/tags/17.1.613.zip"
   sha256 "e1cc327643bea2eea5854954d35be0c838ab23821cd89011ea6fc620db0b7032"
   license "MIT"
   version "17.1.613"

   depends_on "cmake" => :build

   def install
      args = std_cmake_args
      args << "-DBUILD_CSHARP=OFF -DBUILD_EXAMPLE=OFF"
      system "cmake", ".", *args
      system "make", "install"
   end
end
