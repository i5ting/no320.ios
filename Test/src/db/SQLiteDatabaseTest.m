//
//  SQLiteDatabaseTest.m
//  no320.framework.test
//
//  Created by sang alfred on 8/4/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "SQLiteDatabaseTest.h"

@implementation SQLiteDatabaseTest


- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES.
    // Also an async test that calls back on the main thread, you'll probably want to return YES.
    return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}

- (void)testFoo {
    NSString *a = @"foo";
    GHTestLog(@"I can log to the GHUnit test console: %@", a);
    
    // Assert a is not NULL, with no custom error description
//    GHAssertNotNULL(a, nil);
    
    [no320_db_base_context sharedInstance];
    // Assert equal objects, add custom error description
    NSString *b = @"bar";
    GHAssertEqualObjects(a, b, @"A custom error message. a should be equal to: %@.", b);
}

- (void)testBar {
    // Another test
}


@end
