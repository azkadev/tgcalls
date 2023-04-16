cmake_minimum_required(VERSION 3.16)

project(tgcalls_library VERSION 0.0.1 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)
 
message(STATUS "START COMPILE tgcalls")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

set(tgcalls_shared_dir "lib")
set(tgcalls_exe_dir "bin")
set(prefix_shared_library "lib")
 

if (ANDROID)
 set(package_shared_extension "_${ANDROID_ARCH_NAME}.so")
 set(package_exe_extension "")
 set(package_name "tgcalls_${ANDROID_ARCH_NAME}")
elseif (WIN32)
 set(package_shared_extension ".dll")
 set(package_exe_extension ".exe") 
 set(package_name "tgcalls")
elseif (APPLE)
 set(package_shared_extension ".dylib")
 set(package_exe_extension "") 
 set(package_name "tgcalls")
else()
 set(package_shared_extension ".so")
 set(package_exe_extension "") 
 set(package_name "tgcalls")
endif()


add_library(tgcalls_shared SHARED tgcalls.cpp)
add_executable(tgcalls_exe tgcalls.cpp)

set_target_properties(tgcalls_shared PROPERTIES 
  LIBRARY_OUTPUT_DIRECTORY "${tgcalls_shared_dir}"
  PREFIX "${prefix_shared_library}"
  OUTPUT_NAME "${package_name}"
)

set_target_properties(tgcalls_exe PROPERTIES 
  RUNTIME_OUTPUT_DIRECTORY "${tgcalls_exe_dir}"
  OUTPUT_NAME "${package_name}"
)

if (WIN32)
 set_target_properties(tgcalls_shared PROPERTIES
  WINDOWS_EXPORT_ALL_SYMBOLS ON
)
endif (WIN32)
 
add_custom_command(
  TARGET tgcalls_shared POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${tgcalls_shared_dir}/${prefix_shared_library}tgcalls${package_shared_extension}"
)

add_custom_command(
  TARGET tgcalls_exe POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${tgcalls_exe_dir}/tgcalls${package_exe_extension}" 
)

 