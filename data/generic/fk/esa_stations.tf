KPL/FK
 
   FILE: esa_stations.tf
 
   This file was created by PINPOINT.
 
   PINPOINT Version 3.2.0 --- September 6, 2016
   PINPOINT RUN DATE/TIME:    2017-05-14T17:12:38
   PINPOINT DEFINITIONS FILE: esa_stations.defs
   PINPOINT PCK FILE:         /geometry/data/generic/pck/pck00010.tpc
   PINPOINT SPK FILE:         esa_stations.bsp
 
   The input definitions file is appended to this
   file as a comment block.
 
 
   Body-name mapping follows:
 
\begindata
 
   NAIF_BODY_NAME                      += 'REDU-3'
   NAIF_BODY_CODE                      += 399530
 
   NAIF_BODY_NAME                      += 'SANTA-MARIA'
   NAIF_BODY_CODE                      += 399730
 
\begintext
 
 
   Reference frame specifications follow:
 
 
   Topocentric frame REDU-3_TOPO
 
      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.
 
      Topocentric frame REDU-3_TOPO is centered at the
      site REDU-3, which has Cartesian coordinates
 
         X (km):                  0.4091410623538E+04
         Y (km):                  0.3684874599737E+03
         Z (km):                  0.4863181982970E+04
 
      and planetodetic coordinates
 
         Longitude (deg):         5.1463833000000
         Latitude  (deg):        50.0015361000000
         Altitude   (km):         0.3700000000015E+00
 
      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions
 
         Equatorial radius (km):  6.3781366000000E+03
         Polar radius      (km):  6.3567519000000E+03
 
      All of the above coordinates are relative to the frame EARTH_FIXED.
 
 
\begindata
 
   FRAME_REDU-3_TOPO                   =  1399530
   FRAME_1399530_NAME                  =  'REDU-3_TOPO'
   FRAME_1399530_CLASS                 =  4
   FRAME_1399530_CLASS_ID              =  1399530
   FRAME_1399530_CENTER                =  399530
 
   OBJECT_399530_FRAME                 =  'REDU-3_TOPO'
 
   TKFRAME_1399530_RELATIVE            =  'EARTH_FIXED'
   TKFRAME_1399530_SPEC                =  'ANGLES'
   TKFRAME_1399530_UNITS               =  'DEGREES'
   TKFRAME_1399530_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399530_ANGLES              =  (   -5.1463833000000,
                                             -39.9984639000000,
                                             180.0000000000000 )
 
 
\begintext
 
   Topocentric frame SANTA-MARIA_TOPO
 
      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.
 
      Topocentric frame SANTA-MARIA_TOPO is centered at the
      site SANTA-MARIA, which has Cartesian coordinates
 
         X (km):                  0.4617410545269E+04
         Y (km):                 -0.2166464478966E+04
         Z (km):                  0.3817315257244E+04
 
      and planetodetic coordinates
 
         Longitude (deg):       -25.1357200000000
         Latitude  (deg):        36.9972500000000
         Altitude   (km):         0.2760000000021E+00
 
      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions
 
         Equatorial radius (km):  6.3781366000000E+03
         Polar radius      (km):  6.3567519000000E+03
 
      All of the above coordinates are relative to the frame EARTH_FIXED.
 
 
\begindata
 
   FRAME_SANTA-MARIA_TOPO              =  1399730
   FRAME_1399730_NAME                  =  'SANTA-MARIA_TOPO'
   FRAME_1399730_CLASS                 =  4
   FRAME_1399730_CLASS_ID              =  1399730
   FRAME_1399730_CENTER                =  399730
 
   OBJECT_399730_FRAME                 =  'SANTA-MARIA_TOPO'
 
   TKFRAME_1399730_RELATIVE            =  'EARTH_FIXED'
   TKFRAME_1399730_SPEC                =  'ANGLES'
   TKFRAME_1399730_UNITS               =  'DEGREES'
   TKFRAME_1399730_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399730_ANGLES              =  ( -334.8642800000000,
                                             -53.0027500000000,
                                             180.0000000000000 )
 
\begintext
 
 
Definitions file esa_stations.defs
--------------------------------------------------------------------------------
 
begindata
 
    SITES         = ( 'REDU-3',
                      'SANTA-MARIA' )
 
    REDU-3_CENTER = 399
    REDU-3_FRAME  = 'EARTH_FIXED'
    REDU-3_IDCODE = 399530
    REDU-3_LATLON = ( 50.0015361, 5.1463833, 0.370 )
    REDU-3_UP     = 'Z'
    REDU-3_NORTH  = 'X'
 
    SANTA-MARIA_CENTER = 399
    SANTA-MARIA_FRAME  = 'EARTH_FIXED'
    SANTA-MARIA_IDCODE = 399730
    SANTA-MARIA_LATLON = ( 36.99725, -25.13572, 0.276 )
    SANTA-MARIA_UP     = 'Z'
    SANTA-MARIA_NORTH  = 'X'
 
begintext
 
begintext
 
[End of definitions file]
 
