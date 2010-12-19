if(${CPACK_GENERATOR} STREQUAL NSIS)

    # Nice package name at least for NSIS
    set(CPACK_PACKAGE_FILE_NAME kompas-${CPACK_PACKAGE_VERSION}-installer)

endif()
