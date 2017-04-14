KPL/FK

\begindata

        NAIF_BODY_CODE += ( 399900 )
        NAIF_BODY_NAME += ( 'HUMAIN-6M' )

        NAIF_BODY_CODE += ( 399910 )
        NAIF_BODY_NAME += ( 'HUMAIN-34' )

\begintext

    Humain 6M antenna:
      Latitude       50.191850˚ (N 50˚11.511')
      Longitude       5.253233˚ (E  5˚15.194')
      Altitude      294.m

\begindata

        FRAME_HUMAIN6M_TOPO       = 1399900
        FRAME_1399900_NAME        = 'HUMAIN6M_TOPO'
        FRAME_1399900_CLASS       = 4
        FRAME_1399900_CLASS_ID    = 1399900
        FRAME_1399900_CENTER      =  399900

        TKFRAME_1399900_RELATIVE  = 'ITRF93'
        TKFRAME_1399900_SPEC      = 'ANGLES'
        TKFRAME_1399900_UNITS     = 'DEGREES'
        TKFRAME_1399900_AXES      = ( 3, 2, 3 )
        TKFRAME_1399900_ANGLES    = (   -5.2532333
                                       -39.8081500
                                       180.0       )

        OBJECT_399900_FRAME       = 'HUMAIN6M_TOPO'

        FRAME_HUMAIN6M_EQU        = 1399901
        FRAME_1399901_NAME        = 'HUMAIN6M_EQU'
        FRAME_1399901_CLASS       = 4
        FRAME_1399901_CLASS_ID    = 1399901
        FRAME_1399901_CENTER      =  399900

        TKFRAME_1399901_RELATIVE  = 'ITRF93'
        TKFRAME_1399901_SPEC      = 'ANGLES'
        TKFRAME_1399901_UNITS     = 'DEGREES'
        TKFRAME_1399901_AXES      = ( 3, 3, 3 )
        TKFRAME_1399901_ANGLES    = ( -5.2532333 0 0 )

\begintext

    Humain-34 antenna:
      Latitude       50.191833˚ (N 50˚11.510')
      Longitude       5.257467˚ (E  5˚15.448')
      Altitude      294.m

\begindata

        FRAME_HUMAIN34_TOPO       = 1399910
        FRAME_1399910_NAME        = 'HUMAIN34_TOPO'
        FRAME_1399910_CLASS       = 4
        FRAME_1399910_CLASS_ID    = 1399910
        FRAME_1399910_CENTER      =  399910

        TKFRAME_1399910_RELATIVE  = 'ITRF93'
        TKFRAME_1399910_SPEC      = 'ANGLES'
        TKFRAME_1399910_UNITS     = 'DEGREES'
        TKFRAME_1399910_AXES      = ( 3, 2, 3 )
        TKFRAME_1399910_ANGLES    = (   -5.2574667
                                       -39.8081667
                                       180.0       )

        OBJECT_399910_FRAME       = 'HUMAIN34_TOPO'

        FRAME_HUMAIN34_EQU        = 1399911
        FRAME_1399911_NAME        = 'HUMAIN34_EQU'
        FRAME_1399911_CLASS       = 4
        FRAME_1399911_CLASS_ID    = 1399911
        FRAME_1399911_CENTER      =  399910

        TKFRAME_1399911_RELATIVE  = 'ITRF93'
        TKFRAME_1399911_SPEC      = 'ANGLES'
        TKFRAME_1399911_UNITS     = 'DEGREES'
        TKFRAME_1399911_AXES      = ( 3, 3, 3 )
        TKFRAME_1399911_ANGLES    = ( -5.2574667 0 0 )

\begintext

$Id: humain_topo.tf 4736 2013-03-22 15:15:52Z bogdan $
