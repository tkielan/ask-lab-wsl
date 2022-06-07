cmake_minimum_required(VERSION 3.20)

# Build part

project(Whale
    VERSION 0.0.1
    LANGUAGES CXX
)

add_executable(Whale)

target_sources(Whale
    PRIVATE
        src/whale.cpp
)

# Install part

install(TARGETS Whale
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(DIRECTORY doc/
    DESTINATION DESTINATION share/whale
)

install(FILES README.md
    DESTINATION DESTINATION share/whale
)

# Package part

set(CPACK_SOURCE_GENERATOR TXZ)
set(CPACK_SOURCE_IGNORE_FILES
    \\.git/
    build/
    ".*~$"
)
set(CPACK_VERBATIM_VARIABLES TRUE)

set(CPACK_GENERATOR DEB)
set(CPACK_PACKAGE_CONTACT "student@polsl.pl")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libstdc++6 (>= 3.4.26)")

include(CPack)
