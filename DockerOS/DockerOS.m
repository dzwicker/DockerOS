//
//  DockerOS.m
//  DockerOS
//
//  Created by Daniel Zwicker on 01.05.14.
//

#import <AFNetworking/AFHTTPClient.h>
#import <RestKit/Network/RKObjectManager.h>
#import <RestKit/Network/RKResponseDescriptor.h>
#import "DockerOS.h"
#import "DockerVersion.h"

@implementation DockerOS {
    NSURL *_baseURL;
    RKObjectManager *_objectManager;
}

- (instancetype)initWithBaseURL:(NSURL *)aBaseURL {
    self = [super init];
    if (self) {
        _baseURL = aBaseURL;
        AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:_baseURL];
        _objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
        [self addMappings];
        LOG(@"Init DockerRestServoce with base '%@'", _baseURL.absoluteString);
    }

    return self;
}

- (void)addMappings {
    // setup object mappings
    RKObjectMapping *dockerVersionMapping = [RKObjectMapping mappingForClass:[DockerVersion class]];
    [dockerVersionMapping addAttributeMappingsFromArray:@[@"ApiVersion", @"Arch", @"GitCommit", @"GoVersion",
            @"KernelVersion", @"Os", @"Version"]];

    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
            [RKResponseDescriptor responseDescriptorWithMapping:dockerVersionMapping
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/version"
                                                        keyPath:@""
                                                    statusCodes:[NSIndexSet indexSetWithIndex:200]];

    [_objectManager addResponseDescriptor:responseDescriptor];
}

- (void)version:(void (^)(DockerVersion *version))success
        failure:(void (^)(NSError *error))failure {
    [_objectManager getObjectsAtPath:@"/version"
                          parameters:Nil
                             success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                 DockerVersion *version = mappingResult.firstObject;
                                 LOG(@"GET /version result=%@", version);
                                 success(version);
                             }
                             failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                 LOG(@"Unable to call GET /version: %@", error);
                                 if (failure) {
                                     failure(error);
                                 }
                             }
    ];
}

@end
