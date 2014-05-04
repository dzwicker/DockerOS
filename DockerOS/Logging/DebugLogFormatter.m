#import "DebugLogFormatter.h"

@implementation DebugLogFormatter {
    int _loggerCount;
    NSDateFormatter *_dateFormatter;
}

- (id)init {
    return [super init];
}

- (id)initWithDateFormat:(NSString *)dateFormat {
    self = [self init];
    if (self) {
        [self setDateFormat:dateFormat];
    }
    return self;
}

- (void)setDateFormat:(NSString *)dateFormat {
    _dateFormatter = [NSDateFormatter new];
    [_dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {

    NSString *time = [_dateFormatter stringFromDate:logMessage->timestamp];
    NSString *timePrefix = time ? [time stringByAppendingString:@" "] : @"";
    char logLevel = [self letterForLevel:logMessage->logFlag];
    NSString *logMsg = logMessage->logMsg;
    const char *file = logMessage->file;
    const char *basename = strrchr(file, '/') ? strrchr(file, '/') + 1 : file;
    int line = logMessage->lineNumber;
    const char *function = logMessage->function;

    return [NSString stringWithFormat:@"%@%c %@ @ %s:%i %s",
                                      timePrefix, logLevel, logMsg, basename, line, function];
}

- (char)letterForLevel:(int)level {
    switch (level) {
        case LOG_FLAG_ERROR:
            return 'E';

        case LOG_FLAG_WARN:
            return 'W';

        case LOG_FLAG_INFO:
            return 'I';

        default:
            return 'D';
    }
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    _loggerCount++;
    NSAssert(_loggerCount <= 1, @"This logger isn't thread-safe");
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    _loggerCount--;
}

@end
