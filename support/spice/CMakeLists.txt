
add_definitions(-DNON_UNIX_STDIO) # why?

set(SPICE_SUPP_DIR ${SPICE}/src/csupport)
set(SPICE_DIR      ${SPICE}/src/cspice)

include_before(${SPICE}/include ${SPICE_SUPP_DIR} ${SPICE_DIR})
aux_source_directory(${SPICE_SUPP_DIR} SPICE_SUPP_SRCS)
aux_source_directory(${SPICE_DIR} SPICE_SRCS)

add_library(spice SHARED ${SPICE_SUPP_SRCS} ${SPICE_SRCS})
target_link_libraries(spice m)
sidc_install_lib(spice)

macro(spice_bin dir name)
    set(AUX_SRCS "")
    set(SRCS_DIR ${SPICE}/src/${dir})
    aux_source_directory(${SRCS_DIR} AUX_SRCS)

    set(MAIN_SRCS ${SRCS_DIR}/main.x ${SRCS_DIR}/${name}.pgm)
    set_source_files_properties(${MAIN_SRCS} PROPERTIES LANGUAGE C COMPILE_FLAGS "-x c")

    set(exe spice_${name})
    add_executable(${exe} ${AUX_SRCS} ${MAIN_SRCS})
    set_target_properties(${exe} PROPERTIES LINKER_LANGUAGE C)
    target_link_libraries(${exe} spice)
    install(TARGETS ${exe} DESTINATION ${CMAKE_INSTALL_PREFIX}/support)
endmacro()

spice_bin(brief_c brief)
spice_bin(chrnos_c chronos)
spice_bin(ckbref_c ckbrief)
spice_bin(commnt_c commnt)
# no cook
spice_bin(frmdif_c frmdiff)
spice_bin(inspkt_c inspekt)
spice_bin(mkspk_c mkspk)
spice_bin(msopck_c msopck)
spice_bin(spacit_c spacit)
spice_bin(spkdif_c spkdiff)
spice_bin(spkmrg_c spkmerge)
spice_bin(tobin_c tobin)
spice_bin(toxfr_c toxfr)
spice_bin(versn_c version)
