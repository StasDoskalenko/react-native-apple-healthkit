//
//  RCTAppleHealthKit+Methods_Sleep.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-11-06.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//


#import "RCTAppleHealthKit+Methods_Other.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

@implementation RCTAppleHealthKit (Methods_Other)



- (void)other_getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    
    NSPredicate *predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    
    
    [self fetchCategorySamplesOfType:[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis]
                           predicate:predicate
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
                                 if(results){
                                     callback(@[[NSNull null], results]);
                                     return;
                                 } else {
                                     NSLog(@"error getting sleep samples: %@", error);
                                     callback(@[RCTMakeError(@"error getting sleep samples", nil, nil)]);
                                     return;
                                 }
                             }];
    
}

- (void)other_getMindfulMinutesSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    
    NSPredicate *predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    
    [self fetchCategorySamplesOfType:[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession]
                           predicate:predicate
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
                              if(results){
                                  callback(@[[NSNull null], results]);
                                  return;
                              } else {
                                  NSLog(@"error getting mindful minutes: %@", error);
                                  callback(@[RCTMakeError(@"error getting mindful minutes", nil, nil)]);
                                  return;
                              }
                          }];
    
}


@end
