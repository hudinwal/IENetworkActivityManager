//
//  IENetworkActivity.m
//
//  Created by Dinesh on 24/01/15.
//

#import "IENetworkActivity.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define kActivityCountKey @"ActivityCount"

@interface IENetworkActivity()

@property(nonatomic,assign) NSUInteger activityCount;

@end

@implementation IENetworkActivity

static IENetworkActivity * sharedInstance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred;
    
    if (nil != sharedInstance)
        return sharedInstance;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[IENetworkActivity alloc] init];
    });
    
    return sharedInstance;
}

+(void)start
{
    [IENetworkActivity sharedInstance].activityCount++;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+(void)finished
{
    [IENetworkActivity sharedInstance].activityCount--;
    if([IENetworkActivity sharedInstance].activityCount == 0)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
