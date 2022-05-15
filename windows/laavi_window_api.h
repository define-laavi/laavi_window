#ifndef LAAVI_WINDOW_API_H
#define LAAVI_WINDOW_API_H

#include "./laavi_window_common.h"
#include "./laavi_window.h"

namespace laavi_window {

    typedef struct  _LWPrivateAPI{
        TDragAppWindow dragAppWindow;        
    } LWPrivateAPI;

    typedef struct _LWPublicAPI {
        TIsLaaviWindowLoaded isLaaviWindowLoaded;
        TGetAppWindow getAppWindow;
        TSetWindowCanBeShown setWindowCanBeShown;
        TSetMinSize setMinSize;
        TSetMaxSize setMaxSize;
        TSetWindowCutOnMaximize setWindowCutOnMaximize;
    } LWPublicAPI;

}

typedef struct _LWAPI {
    laavi_window::LWPublicAPI* publicAPI;
    laavi_window::LWPrivateAPI* privateAPI;
} LWAPI;

LW_EXPORT LWAPI * laavi_window_api();
#endif