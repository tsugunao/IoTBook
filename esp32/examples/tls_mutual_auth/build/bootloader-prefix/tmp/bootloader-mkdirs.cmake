# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/tsugunao/Work/esp32/v44/esp-idf/components/bootloader/subproject"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/tmp"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src"
  "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/tsugunao/Work/esp32/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
