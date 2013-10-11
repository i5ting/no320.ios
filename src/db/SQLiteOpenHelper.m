//
//  SQLiteOpenHelper.m
//  Gospel_IOS
//
//  Created by sang alfred on 4/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "SQLiteOpenHelper.h"




@implementation SQLiteOpenHelper

@synthesize context;


- (void)registerModel:(no320_db_base_table_model *)table_model
{
//    [self.table_names addObject:table_model];
    
//    [table_model.open_helper onCreate:self.db];
    //    [table_model.open_helper onUpgrade:self.db old_v:model.old_v new_v:model.new_v];
    
}


-(id)init_with_database_name:(NSString *)name old_v:(NSString *)old_v  new_v:(NSString *)new_v
{
    if (self  = [super init]) {
        self.context = [no320_db_base_context sharedInstance];
        
//        no320_db_base_table_model *m = [[no320_db_base_table_model alloc] init_with_table_name:name old_version:old_v new_version:new_v open_helper:self];
       // [self.context add_table_model:m];
    }
    return self;
}

- (void)onCreate:(FMDatabase *)db
{
    // TODO Auto-generated method stub
//    Log.i("TAG", "create table start...");
//    db.execSQL(TABLECONTACTS);
//    
//    
//    Log.i("TAG", "create table over...");
    
}


- (void)onUpgrade:(FMDatabase *)db  old_v:(int)oldVersion new_v:(int)newVersion
{
    // TODO Auto-generated method stub
//    Log.i("TAG", "contactsmanager.db Upgrade...");
//    db.execSQL("DROP TABLE IF EXISTS "+TABLE_CONTACTS);
//    onCreate(db);
//    
}

@end
