//
//  JasonDemoAction.m
//  Jasonette
//
//  Copyright © 2016 seletz. All rights reserved.
//

#include <asl.h>
#import "JasonDemoAction.h"

@implementation JasonDemoAction

@synthesize VC;
@synthesize options;

- (void)demo {
    if(self.options){
        NSString *message = self.options[@"text"];
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
