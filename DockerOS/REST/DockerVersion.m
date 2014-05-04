//
// Created by Daniel Zwicker on 27.04.14.
//

#import "DockerVersion.h"


@implementation DockerVersion {

}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToVersion:other];
}

- (BOOL)isEqualToVersion:(DockerVersion *)version {
    if (self == version)
        return YES;
    if (version == nil)
        return NO;
    if (self.ApiVersion != version.ApiVersion && ![self.ApiVersion isEqualToString:version.ApiVersion])
        return NO;
    if (self.Arch != version.Arch && ![self.Arch isEqualToString:version.Arch])
        return NO;
    if (self.GitCommit != version.GitCommit && ![self.GitCommit isEqualToString:version.GitCommit])
        return NO;
    if (self.GoVersion != version.GoVersion && ![self.GoVersion isEqualToString:version.GoVersion])
        return NO;
    if (self.KernelVersion != version.KernelVersion && ![self.KernelVersion isEqualToString:version.KernelVersion])
        return NO;
    if (self.Os != version.Os && ![self.Os isEqualToString:version.Os])
        return NO;
    if (self.Version != version.Version && ![self.Version isEqualToString:version.Version])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.ApiVersion hash];
    hash = hash * 31u + [self.Arch hash];
    hash = hash * 31u + [self.GitCommit hash];
    hash = hash * 31u + [self.GoVersion hash];
    hash = hash * 31u + [self.KernelVersion hash];
    hash = hash * 31u + [self.Os hash];
    hash = hash * 31u + [self.Version hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.ApiVersion=%@", self.ApiVersion];
    [description appendFormat:@", self.Arch=%@", self.Arch];
    [description appendFormat:@", self.GitCommit=%@", self.GitCommit];
    [description appendFormat:@", self.GoVersion=%@", self.GoVersion];
    [description appendFormat:@", self.KernelVersion=%@", self.KernelVersion];
    [description appendFormat:@", self.Os=%@", self.Os];
    [description appendFormat:@", self.Version=%@", self.Version];
    [description appendString:@">"];
    return description;
}
@end