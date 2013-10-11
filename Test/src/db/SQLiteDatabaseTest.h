//
//  SQLiteDatabaseTest.h
//  no320.framework.test
//
//  Created by sang alfred on 8/4/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import <no320/no320_db_base_context.h>

@interface SQLiteDatabaseTest : GHTestCase

@property(nonatomic,strong,readwrite) no320_db_base_context *db;

@end
