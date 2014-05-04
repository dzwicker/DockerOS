#import <CocoaLumberjack/DDLog.h>

#define ERROR(...) doLog(__FILE__, __LINE__, __FUNCTION__, @"", 0, __VA_ARGS__)
#define WARN(...) doLog(__FILE__, __LINE__, __FUNCTION__, @"", 1, __VA_ARGS__)
#define INFO(...) doLog(__FILE__, __LINE__, __FUNCTION__, @"", 2, __VA_ARGS__)
#ifdef DEBUG
#define LOG(...) doLog(__FILE__, __LINE__, __FUNCTION__, @"", 3, __VA_ARGS__)
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
    #define LOG(...) do {} while (0)
    static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

#define NSLog DDLogInfo

void doLog(const char *file, int lineNumber, const char *functionName,
        NSString *domain, int level, NSString *format, ...) NS_FORMAT_FUNCTION(6, 7);