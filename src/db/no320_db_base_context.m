//
//  no320_db_base_context.m
//  Gospel_IOS
//
//  Created by sang on 4/15/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#define _DBFILE_NAME [NSString stringWithFormat:@"%@",@"gospel_ios.db"]

#define _DBFILE_DIR  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

#import <no320/no320_db_base_context.h>

@implementation no320_db_base_context

@synthesize table_names;

@synthesize db;
@synthesize logsErrors;
@synthesize traceExecution;


+ (no320_db_base_context *)sharedInstance {
	static no320_db_base_context *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    return _sharedInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;
}

#if (!__has_feature(objc_arc))

- (id)retain {
	return self;
}

- (unsigned)retainCount {
	return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release {
	//do nothing
}

- (id)autorelease {
	return self;
}

#endif


#pragma mark - lifecycle

- (id)init {
    if (self = [super init]) {
        NSLog(@"INFO: Begin singleton DataBaseService initialization......");
        
        self.logsErrors = NO;
        self.traceExecution = NO;
        
        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_DBFILE_NAME];
        
        NSString *dir = _DBFILE_DIR;
        NSString *databasePath = [dir stringByAppendingPathComponent:_DBFILE_NAME];
        NSFileManager *tempFileManager = [NSFileManager defaultManager];
        BOOL isExisted = [tempFileManager fileExistsAtPath:databasePath];
        if (!isExisted) {
            NSLog(@"INFO_OC: 复制数据库文件 database.db from %@ to %@.", bundlePath, databasePath);
            NSError *error = nil;
            BOOL success = [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:databasePath error:&error];
            if (!success) {
                NSLog(@"ERROR_OC: Failed to create writable database file with message '%@'.", [error localizedDescription]);
            }
        }
        
        db = [FMDatabase databaseWithPath:databasePath] ;
        
        //打开sql跟踪日志
        db.traceExecution = self.traceExecution;
        db.logsErrors = self.logsErrors;
        
        if (![db open]) {
            NSLog(@"INFO_OC: Failed to open database.");
            //            [db release];
            return self;
        }
        
        [self call];
        
        NSLog(@"INFO_OC: End singleton DataBaseService initialization......");
    }
    return self;
}

-(void)dealloc{
    //    [db close];
    //    [db release];
    //    [queue release];
    //    [super dealloc];
}

#pragma mark - Private Methods Implemetions



#pragma mark - Public Methods Implemetions

-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:(no320_db_base_table_model* (^)(FMResultSet *_rs,int _line_num))rs_block{
    FMResultSet *_rs = [db executeQuery:query_sql];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    int line_num = 0;
    
    if (_rs) {
        while ([_rs next]) {
            @autoreleasepool {
                no320_db_base_table_model *obj = rs_block(_rs,line_num);
                
                if (obj) {
                    [ret_array addObject:obj];
                }
                
                //SAFE_RELEASE(obj);
            }
            
            line_num++;//from 0+
        }
        return ret_array ;
        
    }else {
        // SAFE_RELEASE(ret_array);
        return nil;
    }
}


-(int)find_one_column_by_sql:(NSString *)query_sql
{
    FMResultSet *s =[db executeQuery:query_sql];
    
    if ([s next]) {
        return [s intForColumnIndex:0];
    }
    
    return  0;
}



#pragma mark -

#pragma mark - Private

- (void)call
{
    return;
    //    for (no320_db_base_table_model *model in self.table_names) {
    //        if ([model.open_helper isKindOfClass:[SQLiteOpenHelper class] ]) {
    //            [model.open_helper onCreate:self.db];
    //            [model.open_helper onUpgrade:self.db old_v:model.old_v new_v:model.new_v];
    //        }
    //    }
}




@end
