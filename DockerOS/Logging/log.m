#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DebugLogFormatter.h"

static NSString *const DATE_FORMAT = @"yyyy-MM-dd HH:mm:ss.SSS";

void doLog(const char *file, int lineNumber, const char *functionName,
        NSString *domain, int level, NSString *format, ...) {

    static int __logLevels[4];
    static dispatch_once_t __onceToken;
    dispatch_once(&__onceToken, ^{
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        [DDLog addLogger:[DDASLLogger sharedInstance]];
#ifdef DEBUG
        [DDTTYLogger sharedInstance].logFormatter =
                [[DebugLogFormatter alloc] initWithDateFormat:DATE_FORMAT];
#endif
        __logLevels[0] = LOG_FLAG_ERROR;
        __logLevels[1] = LOG_FLAG_WARN;
        __logLevels[2] = LOG_FLAG_INFO;
        __logLevels[3] = LOG_FLAG_VERBOSE;
    });

    va_list args;
    va_start(args, format);

    [DDLog log:YES
         level:__logLevels[level]
          flag:__logLevels[level]
       context:0
          file:file
      function:functionName
          line:lineNumber
           tag:nil
        format:format
          args:args];

    va_end(args);

}
