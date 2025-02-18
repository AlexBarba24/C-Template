cmake_minimum_required(VERSION 3.10)
project(SimpleProject C)

# Define the source file
set(SOURCE_FILES src/main.c)

# Include the headers
include_directories(include)

# Create the executable
add_executable(main ${SOURCE_FILES})

# Set output directory for Debug and Release
set_target_properties(main PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/bin/Debug
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/bin/Release
)

# Example use of Math library (standard)
target_link_libraries(main PRIVATE m)

# Example use of SDL2 library (nonstandard)
find_package(SDL2 REQUIRED)
target_link_libraries(main PRIVATE SDL2::SDL2)
