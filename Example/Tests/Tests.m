//
//  JasonetteDemoActionTests.m
//  JasonetteDemoActionTests
//
//  Created by Stefan Eletzhofer on 11/18/2016.
//  Copyright (c) 2016 Stefan Eletzhofer. All rights reserved.
//

@import XCTest;

@interface Tests : XCTestCase


@end

@implementation Tests

NSDictionary *success;
NSDictionary *error;

id plugin;

- (void)setUp
{
  [super setUp];

  success = nil;
  error = nil;

  [[NSNotificationCenter defaultCenter]
        addObserverForName:@"Jason.success"
                    object:nil
                     queue:nil
                usingBlock:^(NSNotification *notification){
      NSLog(@"success recv: %@", notification.userInfo);
      success = notification.userInfo;
    }];

  [[NSNotificationCenter defaultCenter]
      addObserverForName:@"Jason.error"
                  object:nil
                   queue:nil
              usingBlock:^(NSNotification *notification){
      NSLog(@"error recv: %@", notification.userInfo);
      error = notification.userInfo;
    }];

  plugin = [self getPlugin];

}

- (id)getPlugin
{
  Class PluginClass = NSClassFromString(@"JasonetteDemoAction");
  id plugin = [[PluginClass alloc] init];
  return plugin;
}

- (void)tearDown
{

  [[NSNotificationCenter defaultCenter]
     removeObserver:self];

  plugin = nil;

  [super tearDown];
}

- (void)testLoadPlugin
{
  Class PluginClass = NSClassFromString(@"JasonetteDemoAction");
  XCTAssertNotNil(PluginClass, @"Cannot load plugin");
}

- (void)testInitPlugin
{
  Class PluginClass = NSClassFromString(@"JasonetteDemoAction");
  XCTAssertNotNil(PluginClass, @"Cannot load plugin");

  id plugin = [[PluginClass alloc] init];
  XCTAssertNotNil(plugin, @"Cannot construct plugin");
}

- (void)testHaveNotificationCenter
{
  NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
  XCTAssertNotNil(defaultCenter, @"no notification center ...");
  NSLog(@"defaultCenter: %@", defaultCenter);
}

- (void)testCallAction
{
  [[NSNotificationCenter defaultCenter]
     postNotificationName:@"JasonetteDemoAction.demo"
                   object:nil
                 userInfo:@{@"options": @{@"text": @"foo"}}];

  NSLog(@"success: %@", success);
  NSLog(@"error: %@", error);

  XCTAssertNil(error, @"Expected error to be nil.");
  XCTAssertNotNil(success, @"Expected success to be called.");
}

- (void)testCallActionErrorPath
{
  [[NSNotificationCenter defaultCenter]
     postNotificationName:@"JasonetteDemoAction.demo"
                   object:nil
                 userInfo:@{@"options": @{}}];

  NSLog(@"success: %@", success);
  NSLog(@"error: %@", error);

  XCTAssertNil(success, @"Expected sucess to be nil.");
  XCTAssertNotNil(error, @"Expected error to be called.");
}

@end

