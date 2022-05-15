#ifndef FLUTTER_PLUGIN_LAAVI_WINDOW_PLUGIN_H_
#define FLUTTER_PLUGIN_LAAVI_WINDOW_PLUGIN_H_

#include <flutter_plugin_registrar.h>

#if defined(__cplusplus)
extern "C" {
#endif

void LaaviWindowPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar);

#define LW_CUSTOM_FRAME    0x1
#define LW_HIDE_ON_STARTUP 0x2

int laavi_window_configure(unsigned int flags);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_PLUGIN_LAAVI_WINDOW_PLUGIN_H_
