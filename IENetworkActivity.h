//
//  IENetworkActivity.h
//
//  Created by Dinesh on 24/01/15.
//

#import <Foundation/Foundation.h>

@interface IENetworkActivity : NSObject

+(instancetype)sharedInstance;
+(void)start;
+(void)finished;

@end
