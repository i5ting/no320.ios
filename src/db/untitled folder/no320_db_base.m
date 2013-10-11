////
////  no320_db_base.m
////  Gospel_IOS
////
////  Created by sang alfred on 4/13/13.
////  Copyright (c) 2013 sang alfred. All rights reserved.
////
//
//#import "no320_db_base.h"
//
//
//@implementation No320BaseModel
//
//@synthesize name;
//
//@end
//
//
//#define SAFE_RELEASE(a) [a release]; a = nil;
//
//#define _DBFILE_NAME [NSString stringWithFormat:@"%@",@"cx_db.sqlite"]
//
//#define _DBFILE_DIR  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//
//
//#pragma mark - No320DatabaseService
//@interface No320DatabaseService()
//
//
//@end
//
//@implementation No320DatabaseService
//@synthesize db_service;
//
//@synthesize traceExecution,logsErrors;
//
//-(id)init
//{
//    if (self = [super init]) {
//        db_service = [DatabaseService sharedInstance];
//    }
//    
//    return self;
//}
//
//
///**
// *
// *
// *
// */
//-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( No320BaseModel *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0)
//{
//    return [db_service find_by_sql:query_sql with_rs_callback:rs_block];
//}
//
//
///**
// * 所有返回一个字段的，都可以使用此
// *
// *
// */
//-(int)find_one_column_by_sql:(NSString *)query_sql
//{
//    return [db_service find_one_column_by_sql:query_sql];
//}
//
//
//@end
//
//
//#pragma mark - DatabaseService
//@interface DatabaseService()
//
//
//@end
//
//@implementation DatabaseService
//@synthesize db;
//@synthesize logsErrors;
//@synthesize traceExecution;
//
//+ (DatabaseService *)sharedInstance {
//	static DatabaseService *_sharedInstance;
//	if(!_sharedInstance) {
//		static dispatch_once_t oncePredicate;
//		dispatch_once(&oncePredicate, ^{
//			_sharedInstance = [[super allocWithZone:nil] init];
//        });
//    }
//    return _sharedInstance;
//}
//
//
//+ (id)allocWithZone:(NSZone *)zone {
//	return [self sharedInstance];
//}
//
//
//- (id)copyWithZone:(NSZone *)zone {
//	return self;
//}
//
//#if (!__has_feature(objc_arc))
//
//- (id)retain {
//	return self;
//}
//
//- (unsigned)retainCount {
//	return UINT_MAX;  //denotes an object that cannot be released
//}
//
//- (oneway void)release {
//	//do nothing
//}
//
//- (id)autorelease {
//	return self;
//}
//
//#endif
//
//#pragma mark - lifecycle
//
//- (id)init {
//    if (self = [super init]) {
//        NSLog(@"INFO: Begin singleton DataBaseService initialization......");
//        
//        self.logsErrors = NO;
//        self.traceExecution = NO;
//        
//        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_DBFILE_NAME];
//        
//        NSString *dir = _DBFILE_DIR;
//        NSString *databasePath = [dir stringByAppendingPathComponent:_DBFILE_NAME];
//        NSFileManager *tempFileManager = [NSFileManager defaultManager];
//        BOOL isExisted = [tempFileManager fileExistsAtPath:databasePath];
//        if (!isExisted) {
//            NSLog(@"INFO_OC: 复制数据库文件 database.db from %@ to %@.", bundlePath, databasePath);
//            NSError *error = nil;
//            BOOL success = [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:databasePath error:&error];
//            if (!success) {
//                NSLog(@"ERROR_OC: Failed to create writable database file with message '%@'.", [error localizedDescription]);
//            }
//        }
//        
//        db = [FMDatabase databaseWithPath:databasePath] ;
//        
//        //打开sql跟踪日志
//        db.traceExecution = self.traceExecution;
//        db.logsErrors = self.logsErrors;
//        
//        if (![db open]) {
//            NSLog(@"INFO_OC: Failed to open database.");
////            [db release];
//            return self;
//        }
//        
//        NSLog(@"INFO_OC: End singleton DataBaseService initialization......");
//    }
//    return self;
//}
//
//-(void)dealloc{
////    [db close];
////    [db release];
////    [queue release];
////    [super dealloc];
//}
//
//#pragma mark - Private Methods Implemetions
//
//
//
//#pragma mark - Public Methods Implemetions
//
//-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:(No320BaseModel* (^)(FMResultSet *_rs,int _line_num))rs_block{
//    FMResultSet *_rs = [db executeQuery:query_sql];
//    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
//    int line_num = 0;
//    
//    if (_rs) {
//        while ([_rs next]) {
//            @autoreleasepool {
//                No320BaseModel *obj = rs_block(_rs,line_num);
//                
//                if (obj) {
//                    [ret_array addObject:obj];
//                }
//                
////                SAFE_RELEASE(obj);
//            }
//            
//            line_num++;//from 0+
//        }
//        return ret_array;
//        
//    }else {
////        SAFE_RELEASE(ret_array);
//        return nil;
//    }
//}
//
//
//-(int)find_one_column_by_sql:(NSString *)query_sql
//{
//    FMResultSet *s =[db executeQuery:query_sql];
//    
//    if ([s next]) {
//        return [s intForColumnIndex:0];
//    }
//    
//    return  0;
//}
//
//
//@end
//
//
//
//
//
//@implementation no320_db_base
//
//@end
