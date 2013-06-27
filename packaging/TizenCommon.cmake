# Copied from libzypp
# Library
IF ( DEFINED LIB )
  SET ( LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${LIB}" )
ELSE ( DEFINED  LIB )
  IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
    SET( LIB_SUFFIX "64" )
  ENDIF(CMAKE_SIZEOF_VOID_P MATCHES "8")
  SET ( LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}" )
ENDIF ( DEFINED  LIB )
MESSAGE(STATUS "Libraries will be installed in ${LIB_INSTALL_DIR}" )

# system configuration dir (etc)
IF( NOT DEFINED SYSCONFDIR )
  IF ( ${CMAKE_INSTALL_PREFIX} STREQUAL "/usr" )
    # if installing in usr, set sysconfg to etc
    SET( SYSCONFDIR /etc )
  ELSE ( ${CMAKE_INSTALL_PREFIX} STREQUAL "/usr" )
    SET ( SYSCONFDIR "${CMAKE_INSTALL_PREFIX}/etc" )
  ENDIF ( ${CMAKE_INSTALL_PREFIX} STREQUAL "/usr" )
ENDIF( NOT DEFINED SYSCONFDIR )
MESSAGE(STATUS "Config files will be installed in ${SYSCONFDIR}" )

# usr INSTALL_PREFIX

IF( DEFINED CMAKE_INSTALL_PREFIX )
  SET( INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} )
ELSE( DEFINED CMAKE_INSTALL_PREFIX )
  SET( INSTALL_PREFIX /usr )
ENDIF( DEFINED CMAKE_INSTALL_PREFIX )

# system configuration dir (etc)
IF( NOT DEFINED MANDIR )
  SET( MANDIR ${INSTALL_PREFIX}/share/man )
ENDIF( NOT DEFINED MANDIR )
MESSAGE( "** Manual files will be installed in ${MANDIR}" )
