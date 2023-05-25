cmake_minimum_required(VERSION 3.12)
project(line_counter)

# Find Flex
find_package(FLEX REQUIRED)

# Generate Flex source file
flex_target(FlexScanner line.l ${CMAKE_CURRENT_BINARY_DIR}/line.yy.cpp)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-register")
endif()

# Add executable target
add_executable(line ${FLEX_FlexScanner_OUTPUTS})

# Link Flex library
target_link_libraries(line PRIVATE l)
