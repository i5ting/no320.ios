//
//  no320_db_base_context.h
//  Gospel_IOS
//
//  Created by sang on 4/15/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "FMDatabaseQueue.h"
//#import "no320_db_base_table_model.h"

#import <no320/no320.h>

@class no320_db_base_table_model;

@interface no320_db_base_context : NSObject
{
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

@property(nonatomic,retain,readwrite) FMDatabase *db;
@property(nonatomic,assign,readwrite) BOOL traceExecution;
@property(nonatomic,assign,readwrite) BOOL logsErrors;


@property(nonatomic,retain,readonly) NSMutableArray *table_names;


/**
 *
 *
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:(no320_db_base_table_model *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0);


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql;


@end
