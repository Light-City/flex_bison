cmake_minimum_required(VERSION 3.12)
project(line_counter)

# Find Flex
find_package(FLEX REQUIRED)

# Generate Flex source file
flex_target(FlexScanner cal.l ${CMAKE_CURRENT_BINARY_DIR}/cal.yy.cpp)
flex_target(FlexScanner token.l ${CMAKE_CURRENT_BINARY_DIR}/token.yy.cpp)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-register")
endif()

# Add executable target
add_executable(cal ${FLEX_FlexScanner_OUTPUTS})
add_executable(token ${FLEX_FlexScanner_OUTPUTS})

# Link Flex library
target_link_libraries(cal PRIVATE l)
target_link_libraries(token PRIVATE l)
