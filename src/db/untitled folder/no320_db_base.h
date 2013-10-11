//
//  no320_db_base.h
//  Gospel_IOS
//
//  Created by sang alfred on 4/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <no320/no320db.h>
#import <no320/no320.h>


@interface No320BaseModel : NSObject

@property(nonatomic,retain) NSString *name;

@end



/**
 *  DatabaseService 封装便捷接口
 *
 *
 */
@interface DatabaseService : NSObject{
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

@property(nonatomic,retain,readwrite) FMDatabase *db;
@property(nonatomic,assign,readwrite) BOOL traceExecution;
@property(nonatomic,assign,readwrite) BOOL logsErrors;

/**
 *
 *
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( No320BaseModel *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0);


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql;

//- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);

@end



/**
 *  No320DatabaseService 是一个委托接口
 *
 *  如果需要子类可以通过访问接口
 *       return  [self.db_service.db executeUpdate:sql,date,nil];
 *
 */
@interface No320DatabaseService : NSObject{
    
}
@property(nonatomic,retain,readonly) DatabaseService *db_service;

@property(nonatomic,assign,readwrite) BOOL traceExecution;
@property(nonatomic,assign,readwrite) BOOL logsErrors;

/**
 *
 *
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( No320BaseModel *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0);


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql;

@end




@interface no320_db_base : NSObject

@end
