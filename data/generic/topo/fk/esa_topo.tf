KPL/FK

\begindata

        NAIF_BODY_CODE += ( 399530 )
        NAIF_BODY_NAME += ( 'REDU3' )

        NAIF_BODY_CODE += ( 399630 )
        NAIF_BODY_NAME += ( 'SG3' )

\begintext

    All coordinates are geodetic WGS84.

    Redu station antennas topographic frame

    REDU-1 antenna:
    (http://www.esa.int/esaMI/Operations/SEM2RDSMTWE_0.html)
      Latitude       50.000456 deg North
      Longitude       5.145344 deg East
      Altitude      386.6m

    Coordinates measured by P2SC team in Redu:

    REDU-3 antenna (nominal, used below):
      Latitude       50.0015361 deg North ( 50deg 0' 05.53" )
      Longitude       5.1463833 deg East  (  5deg 8' 46.98" )
      Altitude      370.m

    REDU-4 antenna (backup, but could become nominal):
      Latitude       50.0023583˚ (N 50˚00'08.49")
      Longitude       5.1431972˚ (E  5˚08'35.51")

\begindata

        FRAME_REDU3_TOPO          = 1399530
        FRAME_1399530_NAME        = 'REDU3_TOPO'
        FRAME_1399530_CLASS       = 4
        FRAME_1399530_CLASS_ID    = 1399530
        FRAME_1399530_CENTER      =  399530

        TKFRAME_1399530_RELATIVE  = 'ITRF93'
        TKFRAME_1399530_SPEC      = 'ANGLES'
        TKFRAME_1399530_UNITS     = 'DEGREES'
        TKFRAME_1399530_AXES      = ( 3, 2, 3 )
        TKFRAME_1399530_ANGLES    = (  -5.1463833
                                      -39.9984639
                                      180.        )

        OBJECT_399530_FRAME       = 'REDU3_TOPO'

\begintext

    Svalbard station antenna topographic frame

    SG-3 antenna:
    (http://www.esa.int/SPECIALS/Operations/SEM8P1SVYVE_0.html)
      Latitude       78.229772˚
      Longitude      15.407786˚
      Altitude      501.3m

\begindata

        FRAME_SG3_TOPO            = 1399630
        FRAME_1399630_NAME        = 'SG3_TOPO'
        FRAME_1399630_CLASS       = 4
        FRAME_1399630_CLASS_ID    = 1399630
        FRAME_1399630_CENTER      =  399630

        TKFRAME_1399630_RELATIVE  = 'ITRF93'
        TKFRAME_1399630_SPEC      = 'ANGLES'
        TKFRAME_1399630_UNITS     = 'DEGREES'
        TKFRAME_1399630_AXES      = ( 3, 2, 3 )
        TKFRAME_1399630_ANGLES    = (  -15.407786
                                       -11.770228
                                       180.       )

        OBJECT_399630_FRAME       = 'SG3_TOPO'

\begintext

$Id: esa_topo.tf 4737 2013-03-22 16:19:50Z bogdan $
