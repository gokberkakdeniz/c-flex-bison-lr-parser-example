/*
    ANSI Escape Codes for colored output

    Set "COLOR" to 0 for disabling,
        "COLOR" to non-zero for enabling.
*/
#ifndef COLOR
#define COLOR 1
#endif

#ifndef COLOR_H
    #define COLOR_H

    #if defined(COLOR) && !(defined(WIN32) || defined(_WIN32) || defined(WIN64) || defined(_WIN64)) && COLOR > 0
        #define COLOR_RED "\x1b[31m"
        #define COLOR_GREEN "\x1b[32m"
        #define COLOR_YELLOW "\x1b[33m"
        #define COLOR_BLUE "\x1b[34m"
        #define COLOR_MAGENTA "\x1b[35m"
        #define COLOR_CYAN "\x1b[36m"
        #define COLOR_RESET "\x1b[0m"
    #else
        #define COLOR_RED ""
        #define COLOR_GREEN ""
        #define COLOR_YELLOW ""
        #define COLOR_BLUE ""
        #define COLOR_MAGENTA ""
        #define COLOR_CYAN ""
        #define COLOR_RESET ""
    #endif 
#endif