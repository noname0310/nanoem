function(fx9_cmake_get_install_path _name _base_path _debug_path _release_path)
  if(DEFINED ENV{FX9_BUILD_DEPENDENCIES_DIRECTORY})
    set(base_path $ENV{FX9_BUILD_DEPENDENCIES_DIRECTORY}/${_name})
  else()
    set(base_path ${PROJECT_SOURCE_DIR}/dependencies/${_name})
  endif()
  get_filename_component(base_path ${base_path} ABSOLUTE)
  if(DEFINED ENV{FX9_TARGET_SYSTEM_NAME})
    set(_system_name $ENV{FX9_TARGET_SYSTEM_NAME})
  else()
    string(TOLOWER ${CMAKE_SYSTEM_NAME} _system_name)
  endif()
  if(DEFINED ENV{FX9_TARGET_COMPILER})
    set(_target_compiler $ENV{FX9_TARGET_COMPILER})
  else()
    set(_target_compiler ${FX9_TARGET_COMPILER})
  endif()
  if(DEFINED ENV{FX9_TARGET_ARCHITECTURES})
    set(_arch $ENV{FX9_TARGET_ARCHITECTURES})
  elseif(DEFINED ENV{FX9_TARGET_ARCHITECTURE})
    set(_arch $ENV{FX9_TARGET_ARCHITECTURE})
  else()
    set(_arch ${FX9_TARGET_ARCHITECTURE})
  endif()
  set(${_base_path} ${base_path} PARENT_SCOPE)
  set(common_prefix_path ${base_path}/out/${_system_name}/${_target_compiler}/${_arch})
  set(${_debug_path} ${common_prefix_path}/debug/install-root PARENT_SCOPE)
  set(${_release_path} ${common_prefix_path}/release/install-root PARENT_SCOPE)
endfunction()

# glslang
fx9_cmake_get_install_path("glslang" GLSLANG_BASE_PATH GLSLANG_INSTALL_PATH_DEBUG GLSLANG_INSTALL_PATH_RELEASE)
find_library(GLSLANG_GENERIC_CODE_GEN_LIBRARY_DEBUG NAMES GenericCodeGen PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_GENERIC_CODE_GEN_LIBRARY_RELEASE NAMES GenericCodeGen PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_GLSLANG_LIBRARY_DEBUG NAMES glslangd glslang PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_GLSLANG_LIBRARY_RELEASE NAMES glslang PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_MACHINE_INDEPENDENT_LIBRARY_DEBUG NAMES MachineIndependent PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_MACHINE_INDEPENDENT_LIBRARY_RELEASE NAMES MachineIndependent PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_OGLCOMPILER_LIBRARY_DEBUG NAMES OGLCompilerd OGLCompiler PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_OGLCOMPILER_LIBRARY_RELEASE NAMES OGLCompiler PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_OSDEPENDENT_LIBRARY_DEBUG NAMES OSDependentd OSDependent PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_OSDEPENDENT_LIBRARY_RELEASE NAMES OSDependent PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_SPIRV_LIBRARY_DEBUG NAMES SPIRVd SPIRV PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_SPIRV_LIBRARY_RELEASE NAMES SPIRV PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_SPV_REMAPPER_LIBRARY_DEBUG NAMES SPVRemapper SPIRV PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(GLSLANG_SPV_REMAPPER_LIBRARY_RELEASE NAMES SPVRemapper PATH_SUFFIXES lib PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_path(GLSLANG_INCLUDE_DIR NAMES glslang/HLSL/hlslParseHelper.h PATH_SUFFIXES include PATHS ${GLSLANG_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
mark_as_advanced(GLSLANG_GENERIC_CODE_GEN_LIBRARY_DEBUG GLSLANG_GENERIC_CODE_GEN_LIBRARY_RELEASE GLSLANG_OSDEPENDENT_LIBRARY_DEBUG GLSLANG_OGLCOMPILER_LIBRARY_DEBUG GLSLANG_SPIRV_LIBRARY_DEBUG GLSLANG_GLSLANG_LIBRARY_DEBUG GLSLANG_SPV_REMAPPER_LIBRARY_DEBUG
                 GLSLANG_OSDEPENDENT_LIBRARY_RELEASE GLSLANG_OGLCOMPILER_LIBRARY_RELEASE GLSLANG_SPIRV_LIBRARY_RELEASE GLSLANG_GLSLANG_LIBRARY_RELEASE GLSLANG_SPV_REMAPPER_LIBRARY_RELEASE)

# spirv-cross
fx9_cmake_get_install_path("spirv-cross" SPIRV_CROSS_BASE_PATH SPIRV_CROSS_INSTALL_PATH_DEBUG SPIRV_CROSS_INSTALL_PATH_RELEASE)
find_library(SPIRV_CROSS_CORE_LIBRARY_DEBUG NAMES spirv-cross-cored spirv-cross-core PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_CPP_LIBRARY_DEBUG NAMES  spirv-cross-cppd spirv-cross-cpp PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_GLSL_LIBRARY_DEBUG NAMES spirv-cross-glsld spirv-cross-glsl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_HLSL_LIBRARY_DEBUG NAMES spirv-cross-hlsld spirv-cross-hlsl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_MSL_LIBRARY_DEBUG NAMES spirv-cross-msld spirv-cross-msl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_CORE_LIBRARY_RELEASE NAMES spirv-cross-core PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_CPP_LIBRARY_RELEASE NAMES spirv-cross-cpp PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_GLSL_LIBRARY_RELEASE NAMES spirv-cross-glsl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_HLSL_LIBRARY_RELEASE NAMES spirv-cross-hlsl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_library(SPIRV_CROSS_MSL_LIBRARY_RELEASE NAMES spirv-cross-msl PATH_SUFFIXES lib PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
find_path(SPIRV_CROSS_INCLUDE_DIR NAMES spirv_cross/spirv_cross.hpp PATH_SUFFIXES include PATHS ${SPIRV_CROSS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
mark_as_advanced(SPIRV_CROSS_INSTALL_PATH_DEBUG SPIRV_CROSS_INSTALL_PATH_DEBUG SPIRV_CROSS_CORE_LIBRARY_DEBUG SPIRV_CROSS_CPP_LIBRARY_DEBUG
                 SPIRV_CROSS_GLSL_LIBRARY_DEBUG SPIRV_CROSS_HLSL_LIBRARY_DEBUG SPIRV_CROSS_MSL_LIBRARY_DEBUG SPIRV_CROSS_CORE_LIBRARY_RELEASE
                 SPIRV_CROSS_CPP_LIBRARY_RELEASE SPIRV_CROSS_GLSL_LIBRARY_RELEASE SPIRV_CROSS_HLSL_LIBRARY_RELEASE SPIRV_CROSS_MSL_LIBRARY_RELEASE
                 SPIRV_CROSS_INCLUDE_DIR)

# lemon
if(DEFINED CMAKE_TOOLCHAIN_FILE OR DEFINED ENV{FX9_TOOLCHAIN_LEMON_DIR})
  find_program(FX9_TOOLCHAIN_LEMON_LOCATION NAMES fx9_lemon PATHS $ENV{FX9_TOOLCHAIN_LEMON_DIR})
  mark_as_advanced(FX9_TOOLCHAIN_LEMON_LOCATION)
  add_executable(fx9_lemon IMPORTED)
  set_target_properties(fx9_lemon PROPERTIES IMPORTED_LOCATION ${FX9_TOOLCHAIN_LEMON_LOCATION})
else()
  add_executable(fx9_lemon ${FX9_PATH}/lemon/lemon.c)
endif()
set_property(TARGET fx9_lemon PROPERTY FOLDER dependencies/effect)

# protobuf
aux_source_directory(${FX9_PATH}/src EFFECT_COMPILER_SOURCES)
file(GLOB EFFECT_PROTO_SOURCES ${FX9_PROTOBUF_PATH}/effect*.pb-c.c)
add_library(fx9_protobuf ${EFFECT_PROTO_SOURCES})
set_property(TARGET fx9_protobuf PROPERTY FOLDER dependencies/effect)
set_property(TARGET fx9_protobuf APPEND PROPERTY INCLUDE_DIRECTORIES ${FX9_DEPENDENCIES_PATH}/protobuf-c)
target_link_libraries(fx9_protobuf protobuf-c)

# gen_parser
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/fx9/Syntax.c
                   COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/fx9
                   COMMAND ${CMAKE_COMMAND} -E copy ${FX9_PATH}/src/Syntax.y ${CMAKE_CURRENT_BINARY_DIR}/fx9
                   COMMAND ${CMAKE_COMMAND} -E env ASAN_OPTIONS="detect_leaks=0"
                           $<TARGET_FILE:fx9_lemon> -T${FX9_PATH}/lemon/lempar.c
                           -q ${CMAKE_CURRENT_BINARY_DIR}/fx9/Syntax.y
                   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                   MAIN_DEPENDENCY ${FX9_PATH}/src/Syntax.y
                   VERBATIM)
add_custom_target(fx9_gen_parser SOURCES ${CMAKE_CURRENT_BINARY_DIR}/fx9/Syntax.c)
add_dependencies(fx9_gen_parser fx9_lemon)
set_property(TARGET fx9_gen_parser PROPERTY FOLDER dependencies/effect)

# fx9
add_library(fx9 ${EFFECT_COMPILER_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/fx9/Syntax.c)
add_dependencies(fx9 fx9_gen_parser)
target_link_libraries(fx9 fx9_protobuf
                          optimized ${GLSLANG_GLSLANG_LIBRARY_RELEASE}
                          optimized ${GLSLANG_SPIRV_LIBRARY_RELEASE}
                          optimized ${GLSLANG_SPV_REMAPPER_LIBRARY_RELEASE}
                          optimized ${GLSLANG_GENERIC_CODE_GEN_LIBRARY_RELEASE}
                          optimized ${GLSLANG_MACHINE_INDEPENDENT_LIBRARY_RELEASE}
                          optimized ${GLSLANG_OGLCOMPILER_LIBRARY_RELEASE}
                          optimized ${GLSLANG_OSDEPENDENT_LIBRARY_RELEASE}
                          optimized ${SPIRV_CROSS_CORE_LIBRARY_RELEASE}
                          optimized ${SPIRV_CROSS_CPP_LIBRARY_RELEASE}
                          optimized ${SPIRV_CROSS_GLSL_LIBRARY_RELEASE}
                          optimized ${SPIRV_CROSS_HLSL_LIBRARY_RELEASE}
                          optimized ${SPIRV_CROSS_MSL_LIBRARY_RELEASE}
                          debug ${GLSLANG_GLSLANG_LIBRARY_DEBUG}
                          debug ${GLSLANG_SPIRV_LIBRARY_DEBUG}
                          debug ${GLSLANG_SPV_REMAPPER_LIBRARY_DEBUG}
                          debug ${GLSLANG_GENERIC_CODE_GEN_LIBRARY_DEBUG}
                          debug ${GLSLANG_MACHINE_INDEPENDENT_LIBRARY_DEBUG}
                          debug ${GLSLANG_OGLCOMPILER_LIBRARY_DEBUG}
                          debug ${GLSLANG_OSDEPENDENT_LIBRARY_DEBUG}
                          debug ${SPIRV_CROSS_CORE_LIBRARY_DEBUG}
                          debug ${SPIRV_CROSS_CPP_LIBRARY_DEBUG}
                          debug ${SPIRV_CROSS_GLSL_LIBRARY_DEBUG}
                          debug ${SPIRV_CROSS_HLSL_LIBRARY_DEBUG}
                          debug ${SPIRV_CROSS_MSL_LIBRARY_DEBUG})
set_property(TARGET fx9 PROPERTY FOLDER dependencies)
set_property(TARGET fx9 APPEND PROPERTY INCLUDE_DIRECTORIES ${FX9_PATH}/include
                        ${CMAKE_CURRENT_BINARY_DIR}/fx9
                        ${GLSLANG_INCLUDE_DIR}
                        ${SPIRV_CROSS_INCLUDE_DIR}
                        ${FX9_PROTOBUF_PATH}
                        ${FX9_DEPENDENCIES_PATH}/protobuf-c)
set_property(TARGET fx9 APPEND PROPERTY COMPILE_DEFINITIONS
                        "FX9_DISASSEMBLE=$<BOOL:${DISASSEMBLE}>"
                        "FX9_DUMP=$<BOOL:${DUMP}>"
                        "FX9_INTERMEDIATE=$<BOOL:${INTERMEDIATE}>"
                        $<$<BOOL:${WIN32}>:_CRT_SECURE_NO_WARNINGS=1>)
set_property(TARGET fx9 APPEND PROPERTY COMPILE_OPTIONS -fno-rtti)
if(WIN32 AND "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set_property(TARGET ${_plugin_name} PROPERTY CXX_STANDARD 14)
else()
  set_property(TARGET ${_plugin_name} PROPERTY CXX_STANDARD 11)
endif()

option(FX9_ENABLE_ASAN "Enable ASAN" OFF)
option(FX9_ENABLE_UBSAN "Enable UBSAN" OFF)
if(FX9_ENABLE_ASAN)
  if(MSVC)
    find_library(ASAN_LIBRARY_DLL_CRT clang_rt.asan_dll_thunk-${NANOEM_TARGET_ARCHITECTURE})
    set_target_properties(fx9 PROPERTIES COMPILE_FLAGS "-fsanitize=address" LINK_FLAGS "-incremental:no /wholearchive:\"${ASAN_LIBRARY_DLL_CRT}\"")
  else()
    set_target_properties(fx9 PROPERTIES COMPILE_FLAGS "-fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls" LINK_FLAGS "-fsanitize=address")
  endif()
elseif(FX9_ENABLE_UBSAN)
  set_target_properties(fx9 PROPERTIES COMPILE_FLAGS "-fsanitize=undefined -fno-omit-frame-pointer" LINK_FLAGS "-fsanitize=undefined")
endif()

# spirv-tools
option(FX9_ENABLE_OPTIMIZER "Enable optimizer using SPIRV-tools" ON)
if(FX9_ENABLE_OPTIMIZER)
  fx9_cmake_get_install_path("spirv-tools" SPIRV_TOOLS_BASE_PATH SPIRV_TOOLS_INSTALL_PATH_DEBUG SPIRV_TOOLS_INSTALL_PATH_RELEASE)
  find_library(SPIRV_TOOLS_LIBRARY_DEBUG NAMES SPIRV-Tools PATH_SUFFIXES lib PATHS ${SPIRV_TOOLS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  find_library(SPIRV_TOOLS_LIBRARY_RELEASE NAMES SPIRV-Tools PATH_SUFFIXES lib PATHS ${SPIRV_TOOLS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  find_library(SPIRV_TOOLS_OPT_LIBRARY_DEBUG NAMES SPIRV-Tools-opt PATH_SUFFIXES lib PATHS ${SPIRV_TOOLS_INSTALL_PATH_DEBUG} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  find_library(SPIRV_TOOLS_OPT_LIBRARY_RELEASE NAMES SPIRV-Tools-opt PATH_SUFFIXES lib PATHS ${SPIRV_TOOLS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  find_path(SPIRV_TOOLS_INCLUDE_DIR NAMES spirv-tools/libspirv.hpp PATH_SUFFIXES include PATHS ${SPIRV_TOOLS_INSTALL_PATH_RELEASE} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  mark_as_advanced(SPIRV_TOOLS_LIBRARY_DEBUG SPIRV_TOOLS_LIBRARY_RELEASE SPIRV_TOOLS_OPT_LIBRARY_DEBUG SPIRV_TOOLS_OPT_LIBRARY_RELEASE SPIRV_TOOLS_INCLUDE_DIR)
  target_link_libraries(fx9 fx9_protobuf
                            optimized ${SPIRV_TOOLS_OPT_LIBRARY_RELEASE}
                            optimized ${SPIRV_TOOLS_LIBRARY_RELEASE}
                            debug ${SPIRV_TOOLS_OPT_LIBRARY_DEBUG}
                            debug ${SPIRV_TOOLS_LIBRARY_DEBUG})
  set_property(TARGET fx9 APPEND PROPERTY COMPILE_DEFINITIONS FX9_ENABLE_OPTIMIZER)
  set_property(TARGET fx9 APPEND PROPERTY INCLUDE_DIRECTORIES ${SPIRV_TOOLS_INCLUDE_DIR})
endif()
