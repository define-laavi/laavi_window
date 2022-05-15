#include "laavi_window_api.h"
#include "laavi_window.h"
#include "laavi_window_common.h"

namespace laavi_window {
    LWPrivateAPI privateAPI = {
        dragAppWindow
    };

    LWPublicAPI publicAPI = {
        isLaaviWindowLoaded,
        getAppWindow,
        setWindowCanBeShown,
        setMinSize,
        setMaxSize,
        setWindowCutOnMaximize
    };
}

LWAPI lwAPI = {
    &laavi_window::publicAPI,
    &laavi_window::privateAPI
};

LW_EXPORT LWAPI* laavi_window_api(){
    return &lwAPI;
}