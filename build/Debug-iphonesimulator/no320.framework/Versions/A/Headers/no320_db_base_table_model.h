//
//  no320_db_base_table_model.h
//  Gospel_IOS
//
//  Created by sang on 4/15/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//


/**
 对于充血模型的思考
 
 
 
 1. Model继承FMDBSet
 这样它就可以把Query出来的东西，map到对象上
 
 2. 必要接口
 建表
 - (void)on_create:(FMDB　*)db;
 
 3. 可选接口
 
 查询接口
 - (NSArray *)query:(NSString *)sql  param:(NSDictionary *)param;
 
 管理接口
 - (Boolean)manage:(NSString *)sql  param:(NSDictionary *)param;
 
 
 */

//#import "FMResultSet.h"
//#import "SQLiteOpenHelper.h"
#import <no320/no320.h>


@protocol no320_db_base_table_model_once_protocol <NSObject>

@optional
- (void)on_table_create:(FMDatabase *)db;
- (void)on_index_create:(FMDatabase *)db;

@end

@protocol no320_db_base_table_model_common_protocol <NSObject>

@optional
//查询接口
- (NSArray *)query:(NSString *)sql  param:(NSDictionary *)param;

//管理接口
- (Boolean  )manage:(NSString *)sql  param:(NSDictionary *)param;

@end




@class no320_db_base_context;

@interface no320_db_base_table_model : FMResultSet <no320_db_base_table_model_once_protocol,no320_db_base_table_model_common_protocol>

@property(nonatomic,assign,readwrite) id<no320_db_base_table_model_once_protocol> no320_db_base_table_model_once_protocol;
@property(nonatomic,assign,readwrite) id<no320_db_base_table_model_common_protocol> no320_db_base_table_model_common_protocol;


@property(nonatomic,retain,readonly) no320_db_base_context *db_service;

@property(nonatomic,assign,readwrite) BOOL traceExecution;
@property(nonatomic,assign,readwrite) BOOL logsErrors;





/**
 *
 *
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( no320_db_base_table_model *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0);


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql;


@end
