//
// Created by Daniel Zwicker on 27.04.14.
//

#import <Foundation/Foundation.h>


@interface DockerVersion : NSObject

@property(nonatomic, strong) NSString *ApiVersion;
@property(nonatomic, strong) NSString *Arch;
@property(nonatomic, strong) NSString *GitCommit;
@property(nonatomic, strong) NSString *GoVersion;
@property(nonatomic, strong) NSString *KernelVersion;
@property(nonatomic, strong) NSString *Os;
@property(nonatomic, strong) NSString *Version;


- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToVersion:(DockerVersion *)version;

- (NSUInteger)hash;

- (NSString *)description;
@end