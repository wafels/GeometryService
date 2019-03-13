KPL/FK

\begintext

    PROBA3 Tangential frame (P3TG):
      * Origin at the centre of mass of the spacecraft
      * X along the origin-to-Sun vector
      * Plane X-Z defined by the origin and the centres of Sun and Earth,
    with Z pointing in the direction of Earth centre
      * Y is Z x X, completing the right-handed reference frame

    This frame is useful to calculate the tangential altitude of the line
    of sight.

\begindata

        FRAME_P3TG                    = -900051
        FRAME_-900051_NAME            = 'P3TG'
        FRAME_-900051_CLASS           = 5
        FRAME_-900051_CLASS_ID        = -900051
        FRAME_-900051_CENTER          = -900

        FRAME_-900051_RELATIVE        = 'J2000'
        FRAME_-900051_DEF_STYLE       = 'PARAMETERIZED'
        FRAME_-900051_FAMILY          = 'TWO-VECTOR'

        FRAME_-900051_PRI_AXIS        = 'X'
        FRAME_-900051_PRI_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
        FRAME_-900051_PRI_OBSERVER    = -900
        FRAME_-900051_PRI_TARGET      = 10
        FRAME_-900051_PRI_ABCORR      = 'LT+S'

        FRAME_-900051_SEC_AXIS        = 'Z'
        FRAME_-900051_SEC_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
        FRAME_-900051_SEC_OBSERVER    = -900
        FRAME_-900051_SEC_TARGET      = 399
        FRAME_-900051_SEC_ABCORR      = 'LT+S'

        FRAME_-900051_ROTATION_STATE  = 'ROTATING'

\begintext

    PROBA3 Solar Equatorial frame (P3SEQ):
      * Origin at the centre of mass of the spacecraft
      * Z along the Sun-to-origin vector (away from the Sun)
      * Y in the plane defined by Z and the solar rotation axis, pointing
    to the solar North pole
      * X is Y x Z, completing the right-handed reference frame

\begindata

        FRAME_P3SEQ                  = -900052
        FRAME_-900052_NAME           = 'P3SEQ'
        FRAME_-900052_CLASS          = 5
        FRAME_-900052_CLASS_ID       = -900052
        FRAME_-900052_CENTER         = -900

        FRAME_-900052_RELATIVE       = 'J2000'
        FRAME_-900052_DEF_STYLE      = 'PARAMETERIZED'
        FRAME_-900052_FAMILY         = 'TWO-VECTOR'

        FRAME_-900052_PRI_AXIS       = '-Z'
        FRAME_-900052_PRI_VECTOR_DEF = 'OBSERVER_TARGET_POSITION'
        FRAME_-900052_PRI_OBSERVER   = -900
        FRAME_-900052_PRI_TARGET     = 10
        FRAME_-900052_PRI_ABCORR     = 'LT+S'

        FRAME_-900052_SEC_AXIS       = 'Y'
        FRAME_-900052_SEC_VECTOR_DEF = 'CONSTANT'
        FRAME_-900052_SEC_FRAME      = 'IAU_SUN'
        FRAME_-900052_SEC_SPEC       = 'RECTANGULAR'
        FRAME_-900052_SEC_VECTOR     = ( 0, 0, 1 )

        FRAME_-900052_ROTATION_STATE = 'ROTATING'

\begintext
