//
//  DockerOS.h
//  DockerOS
//
//  Created by Daniel Zwicker on 01.05.14.
//

#import <Foundation/Foundation.h>

@class DockerVersion;

@interface DockerOS : NSObject

- (instancetype)initWithBaseURL:(NSURL *)aBaseURL;

- (void)version:(void (^)(DockerVersion *version))success
        failure:(void (^)(NSError *error))failure;

@end
