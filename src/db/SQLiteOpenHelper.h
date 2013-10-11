//
//  SQLiteOpenHelper.h
//  Gospel_IOS
//
//  Created by sang alfred on 4/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "no320_db_base_table_model.h"

#import <no320/no320.h>
#import "no320_db_base_context.h"

@class no320_db_base_table_model;
@class no320_db_base_context;


 

@interface SQLiteOpenHelper : NSObject


@property(nonatomic,retain,readwrite) no320_db_base_context *context;

//super(context, DATABASE_NAME, null, DATABASE_VERSION);
-(id)init_with_database_name:(NSString *)name old_v:(NSString *)old_v  new_v:(NSString *)new_v  ;

- (void)registerModel:(no320_db_base_table_model *)table_model;

- (void)onCreate:(FMDatabase *)db;

- (void)onUpgrade:(FMDatabase *)db  old_v:(int)oldVersion new_v:(int)newVersion;

@end
