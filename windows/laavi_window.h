#ifndef LAAVI_WINDOW_H_
#define LAAVI_WINDOW_H_
#include <windows.h>

namespace laavi_window {
    typedef bool (*TIsLaaviWindowLoaded)();
    bool isLaaviWindowLoaded();
    
    typedef void (*TSetWindowCanBeShown)(bool);
    void setWindowCanBeShown(bool value);

    typedef bool (*TDragAppWindow)();
    bool dragAppWindow();

    typedef HWND (*TGetAppWindow)();
    HWND getAppWindow();

    typedef void (*TSetMinSize)(int, int);
    void setMinSize(int width, int height);

    typedef void (*TSetMaxSize)(int, int);
    void setMaxSize(int width, int height);

    typedef void (*TSetWindowCutOnMaximize)(int);
    void setWindowCutOnMaximize(int value);
}
#endif