cmake_minimum_required(VERSION 3.2)

PROJECT(sample)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()

SET(SAMPLE_VERSION_MAJOR "1")
SET(SAMPLE_VERSION_MINOR "0")
SET(SAMPLE_VERSION_PATCH "1")
SET(SAMPLE_VERSION "${SAMPLE_VERSION_MAJOR}.${SAMPLE_VERSION_MINOR}.${SAMPLE_VERSION_PATCH}")

MESSAGE(STATUS "VERSION: ${SAMPLE_VERSION}")

OPTION(USE_SAMPLE "use sample" OFF)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/include/sample_config.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/sample_config.h)

ModuleImport("dmlog" "thirdparty/dmlog")
LibImport("sample" "src/sample_module")
ExeImport("test" "sample;dmlog")

#ADD_CUSTOM_COMMAND(
#TARGET sampletest
#PRE_BUILD
#COMMAND ${CMAKE_COMMAND} -E copy_if_different
#${CMAKE_CURRENT_SOURCE_DIR}/config/test.csv
#$<TARGET_FILE_DIR:sampletest>
#)

#INSTALL(DIRECTORY include/ DESTINATION include)
#INSTALL(TARGETS sample
#        RUNTIME DESTINATION bin
#        LIBRARY DESTINATION lib
#        ARCHIVE DESTINATION lib)

#SET(SAMPLE_LIBS "sample")
#MARK_AS_ADVANCED(${SAMPLE_LIBS})