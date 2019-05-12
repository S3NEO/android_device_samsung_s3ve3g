#include <cutils/log.h>
#include <sys/types.h>
#include <dlfcn.h>
#include <string.h>

extern "C" {
  int property_get(const char * key, char * value, const char * default_value) {
    ALOGE("%s: E", __FUNCTION__);
    if (strcmp("ro.revision", key) == 0) {
      ALOGE("%s: ro.revision was called!", __FUNCTION__);
      strcpy(value, "4");
      return 3;
    }
    ALOGE("%s: called other property: %s", __FUNCTION__, key);
    return ((int( * )(const char * , char *, const char * ))(dlsym((void * ) - 1, "property_get")))(key, value, default_value);
  }
}
