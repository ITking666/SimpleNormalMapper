# **** Install targets for Linux ****
function(setup_install_targets)

    if(NOT BIN_PATH)
        set(BIN_PATH bin)
    endif()

    message(STATUS "Linux/Unix build with system install targets.")

    # Install binaries and data
    install(PROGRAMS ${CMAKE_BINARY_DIR}/${BINARY_NAME} DESTINATION ${BIN_PATH})

    # Install .desktop files
    install(FILES ${CMAKE_SOURCE_DIR}/data/snm.desktop DESTINATION share/applications)

    # Install icons
    install(FILES ${CMAKE_SOURCE_DIR}/data/icons/snm.png DESTINATION share/pixmaps)
    install(FILES ${CMAKE_SOURCE_DIR}/data/icons/snm.png DESTINATION share/icons/hicolor/64x64/apps)

    set(CPACK_DEBIAN_PACKAGE_NAME "snm")
    set(CPACK_DEBIAN_PACKAGE_VERSION ${VERSION})
    set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
    set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Jussi Lind <jussi.lind@iki.fi>")
    set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Simple mind map creation tool.")
    set(CPACK_DEBIAN_PACKAGE_SECTION "Graphics")
    set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")

    set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

    if(DISTRO_VERSION)
        message(STATUS "Distro version: ${DISTRO_VERSION}")
        set(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}-${DISTRO_VERSION}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE})
    else()
        set(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE})
    endif()

    include(CPack)

endfunction()

