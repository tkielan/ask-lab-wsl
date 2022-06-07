cmake_minimum_required(VERSION 3.16)

project(Whale CXX)

add_executable(Whale)

target_sources(Whale
    PRIVATE
        src/whale.cpp
)

set(CPACK_SOURCE_GENERATOR "TXZ")
set(CPACK_SOURCE_IGNORE_FILES
    \\.git/
    build/
    ".*~$"
)
set(CPACK_VERBATIM_VARIABLES TRUE)

set(CPACK_GENERATOR "DEB ZIP")
set(CPACK_PACKAGE_CONTACT "student@polsl.pl")

include(CPack)
