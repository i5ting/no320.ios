//
//  MySQLiteHelper.m
//  no320.framework
//
//  Created by sang alfred on 8/1/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

/**
 public static final String TABLE_COMMENTS = "comments";
 public static final String COLUMN_ID = "_id";
 public static final String COLUMN_COMMENT = "comment";
 
 private static final String DATABASE_NAME = "commments.db";
 private static final int DATABASE_VERSION = 1;
 
 // Database creation sql statement
 private static final String DATABASE_CREATE = "create table "
 + TABLE_COMMENTS + "(" + COLUMN_ID
 + " integer primary key autoincrement, " + COLUMN_COMMENT
 + " text not null);";
 
 public MySQLiteHelper(Context context) {
 super(context, DATABASE_NAME, null, DATABASE_VERSION);
 }
 
 @Override
 public void onCreate(SQLiteDatabase database) {
 database.execSQL(DATABASE_CREATE);
 }
 
 @Override
 public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
 Log.w(MySQLiteHelper.class.getName(),
 "Upgrading database from version " + oldVersion + " to "
 + newVersion + ", which will destroy all old data");
 db.execSQL("DROP TABLE IF EXISTS " + TABLE_COMMENTS);
 onCreate(db);
 }
 
 */
#import "MySQLiteHelper.h"

@implementation MySQLiteHelper

-(id)init
{
    if (self = [super init]) {
        
        
    }
    
    return self;
}

//-(id)init:(no320_db_base_context*)context
//{
//    if (self = [super init]) {
//        
//        
//    }
//    
//    return self;
//}

@end
