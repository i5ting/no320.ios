//
//  DbTest.m
//  no320.framework.test
//
//  Created by sang alfred on 8/4/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DbTest.h"

#import <no320/no320.h>

@implementation DbTest

+(void)testA{
    [self testB];
}

+(void)testB
{
    [self testA];
}

-(void)testDb
{
    [[no320_db_base_context sharedInstance] find_one_column_by_sql:@"select name from sang"];
    
    
    NSMutableArray *d =[[no320_db_base_context sharedInstance] find_by_sql:@"select * from sang" with_rs_callback:^no320_db_base_table_model *(FMResultSet *_rs, int _line_num) {
        

        no320_db_base_table_model *d =[no320_db_base_table_model new];
        return d;
    }];
    GHAssertNULL(@"dd", @"ddd");
    
}

- (void)testddd{
}

-(void)testDbsdds
{
//    GHAssertNULL(@"dd", @"ddd");
//    GHAssertNULL(nil, @"dd");
//    
//    GHAssertTrue(NO, @"ddd");
    
//    Helloworld *h = [[Helloworld alloc] init];
//    [h say];
    
    [no320_db_base_context sharedInstance];
    
    GHAssertNULL(nil, @"dd");
    
}

@end
