cmake_minimum_required(VERSION 3.10)
project(tgcalls_flutter_library VERSION 0.0.0 LANGUAGES C CXX)

add_library(tgcalls_flutter SHARED
  "tgcalls.cpp"
)

set_target_properties(tgcalls_flutter PROPERTIES
  # PUBLIC_HEADER tgcalls_flutter.h
  OUTPUT_NAME "tgcalls"
)

target_compile_definitions(tgcalls_flutter PUBLIC DART_SHARED_LIB)
