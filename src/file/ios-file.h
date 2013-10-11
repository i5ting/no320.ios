//
//  ios-file.h
//  ios-file
//
//  Created by sang alfred on 9/4/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "NSOpenDir.h"

@interface NSFileManager (no320)
+ (NSString *) pathForItemNamed: (NSString *) fname inFolder: (NSString *) path;
+ (NSString *) pathForDocumentNamed: (NSString *) fname;
+ (NSString *) pathForBundleDocumentNamed: (NSString *) fname;

+ (NSArray *) pathsForItemsMatchingExtension: (NSString *) ext inFolder: (NSString *) path;
+ (NSArray *) pathsForDocumentsMatchingExtension: (NSString *) ext;
+ (NSArray *) pathsForBundleDocumentsMatchingExtension: (NSString *) ext;

+ (NSArray *) filesInFolder: (NSString *) path;

// The methods below are not implemented in upstream repository and UIImage class handles these cases.
// So commenting out.
//+ (UIImage *) imageNamed: (NSString *) aName;
//+ (UIImage *) imageFromURLString: (NSString *) urlstring;


//wrapper method

+ (void)createDirInDocuments:(NSString *)dir;
+ (void)createDirInLibrary:(NSString *)dir;
+ (void)createDirInBundle:(NSString *)dir;
+ (void)createDirInTmp:(NSString *)dir;
+ (void)createDirInDCIM:(NSString *)dir;


+ (BOOL)isDirExistInDocuments:(NSString *)dir;
+ (BOOL)isDirExistInLibrary:(NSString *)dir;
+ (BOOL)isDirExistInBundle:(NSString *)dir;
+ (BOOL)isDirExistInTmp:(NSString *)dir;
+ (BOOL)isDirExistInDCIM:(NSString *)dir;


//
+ (void)createDir:(NSString *)dir base:(NSString *)baseDir;
+ (void)createOneDir:(NSString *)dir base:(NSString *)baseDir;

+ (BOOL)isDirExist:(NSString *)dir base:(NSString *)baseDir;


+ (NSMutableString *)dump:(NSString *)dir base:(NSString *)baseDir;

@end
