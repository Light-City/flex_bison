cmake_minimum_required(VERSION 3.12)
project(line_counter)

# Find Flex
find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

# Generate Flex source file
bison_target(BisonParser cal.y ${CMAKE_CURRENT_BINARY_DIR}/cal_parser.cpp)
flex_target(FlexScanner cal.l ${CMAKE_CURRENT_BINARY_DIR}/cal_lexer.cpp)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-register")
endif()

# Add executable target
add_executable(cal
    ${BISON_BisonParser_OUTPUTS}
    ${FLEX_FlexScanner_OUTPUTS}
)

# Link Flex library
target_link_libraries(cal PRIVATE l)
