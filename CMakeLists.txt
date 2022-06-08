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

# Build documentation in PDF
# See https://github.com/Wandmalfarbe/pandoc-latex-template/
# for eisvogel LATEX template
add_custom_target(doc
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/doc
    COMMAND pandoc JUST-DO-IT.md -o ${CMAKE_CURRENT_BINARY_DIR}/JUST-DO-IT.pdf --from markdown --template eisvogel --listings
    BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/JUST-DO-IT.pdf
)

# Install part

install(TARGETS Whale
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(DIRECTORY doc/
    DESTINATION share/whale
)

install(FILES README.md ${CMAKE_CURRENT_BINARY_DIR}/JUST-DO-IT.pdf
    DESTINATION share/whale
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
