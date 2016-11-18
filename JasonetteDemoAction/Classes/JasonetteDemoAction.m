//
//  JasonetteDemoAction.m
//  Jasonette
//
//  Copyright © 2016 seletz. All rights reserved.
//

#include <asl.h>
#import "JasonetteDemoAction.h"

@implementation JasonetteDemoAction

@synthesize VC;
@synthesize options;

-(id)init {
    if(self = [super init]) {
        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(demo:)
                   name:@"JasonetteDemoAction.demo"
                 object:nil];
    }
    
    return self;
}

- (void)demo:(NSNotification *)notification {
    NSDictionary *args = notification.userInfo;
    NSDictionary *options = args[@"options"];
    
    if (options[@"text"]) {
        NSString *message = options[@"text"];
        asl_log(NULL, NULL, ASL_LEVEL_DEBUG, "%s", [message UTF8String]);
        [[NSNotificationCenter defaultCenter]
            postNotificationName:@"success"
                          object:@{@"result": @"foo"}];
    } else {
        [[NSNotificationCenter defaultCenter]
            postNotificationName:@"error"
                          object:@{@"error": @"text option missing."}];
        
    }
}
                

@end
