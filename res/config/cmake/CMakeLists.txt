# cmake環境設定
cmake_minimum_required(VERSION 3.13)

# project設定
project(main)

# exe設定
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Weverything")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/test)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/bin)

# src設定
file(GLOB_RECURSE SRC "${PROJECT_SOURCE_DIR}/src/*.cpp" "${PROJECT_SOURCE_DIR}/src/*.c")
add_executable(${PROJECT_NAME} ${SRC})

# include設定
include_directories(
    ${PROJECT_SOURCE_DIR}/include
    # /usr/local/Cellar/allegro/*/include
)

# lib設定
link_directories(
    ${PROJECT_SOURCE_DIR}/lib
    # /usr/local/Cellar/allegro/*/lib
)
file(GLOB_RECURSE LIB "${PROJECT_SOURCE_DIR}/lib/*.dylib" # "/usr/local/Cellar/allegro/*/lib/*.dylib"
)
target_link_libraries(${PROJECT_NAME} ${LIB})

# flag設定
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD 17)

# message設定
message("PROJECT_SOURCE_DIR                     = ${PROJECT_SOURCE_DIR}")
message("CURRENT_BINARY_DIR                     = ${PROJECT_BINARY_DIR}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG   = ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE = ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}")
