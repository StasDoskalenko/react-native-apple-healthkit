//
//  RCTAppleHealthKit+Methods_Other.h
//  RCTAppleHealthKit
//

#import "RCTAppleHealthKit.h"

@interface RCTAppleHealthKit (Methods_Other)

- (void)other_getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)other_getMindfulMinutesSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end
