KPL/FK

\begindata

    NAIF_BODY_CODE += ( -900 )
    NAIF_BODY_NAME += ( 'PROBA-3' )

    NAIF_BODY_CODE += ( -900 )
    NAIF_BODY_NAME += ( 'P3_CSC' )
    NAIF_BODY_CODE += ( -900100 )
    NAIF_BODY_NAME += ( 'P3_CI' )
    NAIF_BODY_CODE += ( -900101 )
    NAIF_BODY_NAME += ( 'P3_CI_IO' )
    NAIF_BODY_CODE += ( -900 )
    NAIF_BODY_NAME += ( 'P3_CI_PUPIL' )

    NAIF_BODY_CODE += ( -901 )
    NAIF_BODY_NAME += ( 'P3_OSC' )
    NAIF_BODY_CODE += ( -901 )
    NAIF_BODY_NAME += ( 'P3_OSC_OD' )

\begintext

\begindata

    FRAME_P3_ECI                  = -900000
    FRAME_-900000_NAME            = 'P3_ECI'
    FRAME_-900000_CLASS           = 4
    FRAME_-900000_CLASS_ID        = -900000
    FRAME_-900000_CENTER          = 399
    TKFRAME_-900000_SPEC          = 'MATRIX'
    TKFRAME_-900000_RELATIVE      = 'J2000'
    TKFRAME_-900000_MATRIX        = ( 1 0 0
                                      0 1 0
                                      0 0 1 )

    FRAME_-900000_ROTATION_STATE  = 'INERTIAL'

\begintext

\begindata

    FRAME_P3_IHE                  = -900001
    FRAME_-900001_NAME            = 'P3_IHE'
    FRAME_-900001_CLASS           = 4
    FRAME_-900001_CLASS_ID        = -900001
    FRAME_-900001_CENTER          = 10

    TKFRAME_-900001_SPEC          = 'MATRIX'
    TKFRAME_-900001_RELATIVE      = 'ECLIPJ2000'
    TKFRAME_-900001_MATRIX        = ( 1 0 0
                                      0 1 0
                                      0 0 1 )

    FRAME_-900001_ROTATION_STATE  = 'INERTIAL'

\begintext

    PROBA-3 CSC Solar Equatorial frame (P3CSEQ):
        * Origin at the centre of mass of the CSC
        * Z along the Sun-to-origin vector (away from the Sun)
        * Y in the plane defined by Z and the solar rotation axis, pointing
        to the solar North pole
        * X is Y x Z, completing the right-handed reference frame

\begindata

    FRAME_P3_CSEQ                 = -900010
    FRAME_-900010_NAME            = 'P3_CSEQ'
    FRAME_-900010_CLASS           = 5
    FRAME_-900010_CLASS_ID        = -900010
    FRAME_-900010_CENTER          = 'P3_CSC'

    FRAME_-900010_RELATIVE        = 'J2000'
    FRAME_-900010_DEF_STYLE       = 'PARAMETERIZED'
    FRAME_-900010_FAMILY          = 'TWO-VECTOR'

    FRAME_-900010_PRI_AXIS        = '-Z'
    FRAME_-900010_PRI_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
    FRAME_-900010_PRI_OBSERVER    = 'P3_CSC'
    FRAME_-900010_PRI_TARGET      = 10
    FRAME_-900010_PRI_ABCORR      = 'LT+S'

    FRAME_-900010_SEC_AXIS        = 'Y'
    FRAME_-900010_SEC_VECTOR_DEF  = 'CONSTANT'
    FRAME_-900010_SEC_FRAME       = 'IAU_SUN'
    FRAME_-900010_SEC_SPEC        = 'RECTANGULAR'
    FRAME_-900010_SEC_VECTOR      = ( 0, 0, 1 )

    FRAME_-900010_ROTATION_STATE  = 'ROTATING'

\begintext

\begindata

    FRAME_P3_OLVLH                = -901000
    FRAME_-901000_NAME            = 'P3_OLVLH'
    FRAME_-901000_CLASS           = 5
    FRAME_-901000_CLASS_ID        = -901000
    FRAME_-901000_CENTER          = 'P3_OSC'

    FRAME_-901000_RELATIVE        = 'J2000'
    FRAME_-901000_DEF_STYLE       = 'PARAMETERIZED'
    FRAME_-901000_FAMILY          = 'TWO-VECTOR'

    FRAME_-901000_PRI_AXIS        = 'Z'
    FRAME_-901000_PRI_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
    FRAME_-901000_PRI_OBSERVER    = 'P3_OSC'
    FRAME_-901000_PRI_TARGET      = 399
    FRAME_-901000_PRI_ABCORR      = 'NONE'

    FRAME_-901000_SEC_AXIS        = '-Y'
    FRAME_-901000_SEC_VECTOR_DEF  = 'OBSERVER_TARGET_VELOCITY'
    FRAME_-901000_SEC_OBSERVER    = 'P3_OSC'
    FRAME_-901000_SEC_TARGET      = 399
    FRAME_-901000_SEC_ABCORR      = 'NONE'
    FRAME_-901000_SEC_FRAME       = 'J2000'

    FRAME_-901000_ROTATION_STATE  = 'ROTATING'

\begintext

\begindata

    FRAME_P3_STF                  = -901001
    FRAME_-901001_NAME            = 'P3_STF'
    FRAME_-901001_CLASS           = 5
    FRAME_-901001_CLASS_ID        = -901001
    FRAME_-901001_CENTER          = 'P3_OSC_OD'

    FRAME_-901001_RELATIVE        = 'J2000'
    FRAME_-901001_DEF_STYLE       = 'PARAMETERIZED'
    FRAME_-901001_FAMILY          = 'TWO-VECTOR'

    FRAME_-901001_PRI_AXIS        = '-X'
    FRAME_-901001_PRI_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
    FRAME_-901001_PRI_OBSERVER    = 'P3_OSC_OD'
    FRAME_-901001_PRI_TARGET      = 10
    FRAME_-901001_PRI_ABCORR      = 'LT+S'

    FRAME_-901001_SEC_AXIS        = 'Z'
    FRAME_-901001_SEC_VECTOR_DEF  = 'CONSTANT'
    FRAME_-901001_SEC_FRAME       = 'P3_IHE'
    FRAME_-901001_SEC_SPEC        = 'RECTANGULAR'
    FRAME_-901001_SEC_VECTOR      = ( 0, 0, 1 )

    FRAME_-901001_ROTATION_STATE  = 'ROTATING'

\begintext

    Fictive OSC 150m in front of CSC in the Sun direction

\begindata

    SITES = ( 'P3_OSC' )

    P3_OSC_CENTER = 'P3_CSC'
    P3_OSC_FRAME  = 'P3_CSEQ'
    P3_OSC_IDCODE = -901
    P3_OSC_XYZ    = ( 0,  0, -0.15 )

\begintext
