cmake_minimum_required(VERSION 2.6)

set(CMAKE_MODULE_PATH
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/"
    "${CMAKE_CURRENT_SOURCE_DIR}/core/modules/"
    "${CMAKE_CURRENT_SOURCE_DIR}/qt/modules/")

add_subdirectory(core)
add_subdirectory(qt)
#add_subdirectory(sdl)
add_subdirectory(plugins)
add_subdirectory(plugins-nonfree)

if(BUILD_TESTS)
    enable_testing()
endif()

#
# CPack configuration
#

# Package name and version
set(CPACK_PACKAGE_NAME "Kompas")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Portable navigation system.")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "1")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING.LESSER")

# Otherwise it will try to install into /usr
set(CPACK_SET_DESTDIR ON)

# Strip all files
set(CPACK_STRIP_FILES ON)

# Per-generator settings
set(CPACK_PROJECT_CONFIG_FILE "${CMAKE_SOURCE_DIR}/package/CPackOptions.cmake")

# Installer header image
set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/artwork/nsis\\\\nsis-header.bmp")

# Icon for entry in Add/Remove Programs
set(CPACK_NSIS_INSTALLED_ICON_NAME "kompas-qt.exe")

# Contact
set(CPACK_NSIS_HELP_LINK "http://mosra.cz/blog/kompas.php")
set(CPACK_NSIS_URL_INFO_ABOUT "http://mosra.cz/blog/index-en.php")
set(CPACK_NSIS_CONTACT "mosra@centrum.cz")

# Executable and its caption for start menu entry
# - CPack insists on creating shortcut to bin/ subfolder, ugly workaround
# - http://public.kitware.com/Bug/view.php?id=7828
# - http://public.kitware.com/Bug/view.php?id=7829
# - TWO YEARS! TWO FUCKING YEARS AND STILL NOT FIXED! DAMN! BURN IN HELL!
set(CPACK_PACKAGE_EXECUTABLES "" "")
set(CPACK_NSIS_MENU_LINKS "kompas-qt.exe" "Kompas")

# Install directory
set(CPACK_PACKAGE_INSTALL_DIRECTORY "Kompas")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "Kompas")

# Uninstalling old version
set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "IfFileExists \\\"$INSTDIR\\\\Uninstall.exe\\\" 0 +2
        ExecWait '\\\"$INSTDIR\\\\Uninstall.exe\\\" /S _?=$INSTDIR'")

# Desktop shortcut
set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "
    CreateShortCut \\\"$DESKTOP\\\\Kompas.lnk\\\" \\\"$INSTDIR\\\\kompas-qt.exe\\\"
")

set(CPACK_NSIS_EXTRA_UNINSTALL_COMMANDS "
    Delete \\\"$DESKTOP\\\\Kompas.lnk\\\"
")

# Finally include CPack (this must be at the end)
include(CPack)
