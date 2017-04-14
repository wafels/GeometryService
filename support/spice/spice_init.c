
static const char _versionid_[] __attribute__ ((unused)) =
    "$Id: spice_init.c 5107 2014-06-19 12:26:29Z bogdan $";

static void _spice_init_(void) __attribute__ ((constructor));

#ifdef __APPLE__

#include <stddef.h>
#include <crt_externs.h>

char **environ = NULL;

static void _spice_init_(void)
{
    environ = *_NSGetEnviron();
}

#else

static void _spice_init_(void)
{
}

#endif
