#ifndef LAAVI_WINDOW_UTIL_H_
#define LAAVI_WINDOW_UTIL_H_

#define WM_LW_ACTION 0x7FFE

#define LW_SETWINDOWPOS        1
#define LW_SETWINDOWTEXT       2
#define LW_FORCECHILDREFRESH   3

typedef struct _SWPParam {
    int x;
    int y;
    int cx;
    int cy;
    UINT uFlags;
} SWPParam;

typedef struct _SWTParam {
    LPCWSTR text;
} SWTParam;

#endif /* LAAVI_WINDOW_UTIL_H_ */ 
