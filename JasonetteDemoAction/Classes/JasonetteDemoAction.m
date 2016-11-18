//
//  JasonetteDemoAction.m
//  Jasonette
//
//  Copyright © 2016 seletz. All rights reserved.
//

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
    NSDictionary *args = notification.object;
    NSDictionary *options = args[@"options"];
    
    if (options[@"text"]) {
        NSString *message = options[@"text"];
        NSLog(@"JasonetteDemoAction: text: %@", message);
        [[NSNotificationCenter defaultCenter]
            postNotificationName:@"Jason.success"
                          object:@{@"result": @"foo"}];
    } else {
        [[NSNotificationCenter defaultCenter]
            postNotificationName:@"Jason.error"
                          object:@{@"error": @"text option missing."}];
        
    }
}

@end
