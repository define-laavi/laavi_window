#ifndef LAAVI_WINDOW_COMMON
#define LAAVI_WINDOW_COMMON

#if defined(__cplusplus)
    #define LW_EXTERN extern "C" 
#else
    #define LW_EXTERN extern
#endif

#if !defined(LW_VISIBLE)
    #define LW_VISIBLE __declspec(dllexport)
#endif

#if !defined(LW_EXPORT)
    #define LW_EXPORT  LW_EXTERN LW_VISIBLE
#endif

#endif