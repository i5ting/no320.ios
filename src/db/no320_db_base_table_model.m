//
//  no320_db_base_table_model.m
//  Gospel_IOS
//
//  Created by sang on 4/15/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "no320_db_base_table_model.h"

@implementation no320_db_base_table_model

@synthesize no320_db_base_table_model_once_protocol;
@synthesize no320_db_base_table_model_common_protocol;

@synthesize db_service;

@synthesize traceExecution,logsErrors;




-(id)init
{
    if (self = [super init]) {
        db_service = [no320_db_base_context sharedInstance];
        self.no320_db_base_table_model_once_protocol = self;
        self.no320_db_base_table_model_common_protocol = self;
    }
    
    return self;
}


/**
 *
 *
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( no320_db_base_table_model *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0)
{
    return [db_service find_by_sql:query_sql with_rs_callback:rs_block];
}


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql
{
    return [db_service find_one_column_by_sql:query_sql];
}

#pragma mark - once
- (void)on_table_create:(FMDatabase *)db
{
    if ([self.no320_db_base_table_model_once_protocol respondsToSelector:@selector(on_table_create:)]) {
        [self.no320_db_base_table_model_once_protocol on_table_create:self.db_service.db];
    }
}

- (void)on_index_create:(FMDatabase *)db
{

}

#pragma mark - common

//查询接口
- (NSArray *)query:(NSString *)sql  param:(NSDictionary *)param
{
    
}

//管理接口
- (Boolean  )manage:(NSString *)sql  param:(NSDictionary *)param;
{

}

@end
