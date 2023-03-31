#ifndef StoreKitTestingService_h
#define StoreKitTestingService_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StoreKitTestingServiceProtocol

- (void)saveConfigurationData:(NSData *)data
                  forBundleID:(NSString *)bundleID
                   completion:(void (^)(NSError * _Nullable error))completion;

- (void)removeConfigurationForBundleID:(NSString *)bundleID
                            completion:(void (^)(NSError * _Nullable error))completion;

- (void)deleteAllTransactionsForBundleID:(NSString *)bundleID
                              completion:(void (^)(NSError * _Nullable error))completion;

- (void)clearOverridesForBundleID:(NSString *)bundleID
                       completion:(void (^)(NSError * _Nullable error))completion;

- (void)setIntegerValue:(NSInteger)integerValue
          forIdentifier:(NSUInteger)identifier
            forBundleID:(NSString *)bundleID
             completion:(void (^)(NSError * _Nullable error))completion;
@end

@interface StoreKitTestingService: NSObject<StoreKitTestingServiceProtocol>

@end

NS_ASSUME_NONNULL_END

#endif /* CookpadXPCConnection_h */

