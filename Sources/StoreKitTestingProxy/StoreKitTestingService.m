#import <Foundation/Foundation.h>
#import "StoreKitTestingService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSXPCConnection (ExposeInit)

- (instancetype)initWithMachServiceName:(NSString *)name
                                options:(NSXPCConnectionOptions)options;
@end

@implementation StoreKitTestingService {
    NSXPCConnection *_connection;
    id<StoreKitTestingServiceProtocol> _proxy;
}

- (instancetype)init {
    self = [super init];

    _connection = (NSXPCConnection *)[(id)[NSXPCConnection alloc] initWithMachServiceName:@"com.apple.storekit.configuration.xpc"
                                                                                  options:NSXPCConnectionPrivileged];
    [_connection resume];

    _connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(StoreKitTestingServiceProtocol)];
    _proxy = [_connection synchronousRemoteObjectProxyWithErrorHandler:^(NSError *error) {
        NSLog(@"proxy error: %@", error);
    }];

    return self;
}

- (void)dealloc {
    [_connection suspend];
}

- (void)saveConfigurationData:(NSData *)data
                  forBundleID:(NSString *)bundleID
                   completion:(void (^)(NSError * _Nullable))completion {
    [_proxy saveConfigurationData:data
                     forBundleID:bundleID
                       completion:completion];
}

- (void)clearOverridesForBundleID:(nonnull NSString *)bundleID
                       completion:(nonnull void (^)(NSError * _Nullable))completion {
    [_proxy clearOverridesForBundleID:bundleID
                           completion:completion];
}


- (void)deleteAllTransactionsForBundleID:(nonnull NSString *)bundleID
                              completion:(nonnull void (^)(NSError * _Nullable))completion {
    [_proxy deleteAllTransactionsForBundleID:bundleID completion:completion];
}


- (void)removeConfigurationForBundleID:(nonnull NSString *)bundleID
                            completion:(nonnull void (^)(NSError * _Nullable))completion {
    [_proxy removeConfigurationForBundleID:bundleID completion:completion];
}


- (void)setIntegerValue:(NSInteger)integerValue
          forIdentifier:(NSUInteger)identifier
            forBundleID:(nonnull NSString *)bundleID
             completion:(nonnull void (^)(NSError * _Nullable))completion {
    [_proxy setIntegerValue:integerValue
              forIdentifier:identifier
                forBundleID:bundleID
                 completion:completion];
}


@end

NS_ASSUME_NONNULL_END



