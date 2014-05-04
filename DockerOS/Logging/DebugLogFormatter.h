#import "DDlog.h"

@interface DebugLogFormatter : NSObject <DDLogFormatter>

- (id)init;

- (id)initWithDateFormat:(NSString *)dateFormat;

@end
