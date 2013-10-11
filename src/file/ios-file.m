//
//  ios-file.m
//  ios-file
//
//  Created by sang alfred on 9/4/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "ios-file.h"
 

@implementation NSFileManager (no320)
+ (NSString *) pathForItemNamed: (NSString *) fname inFolder: (NSString *) path
{
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while ((file = [dirEnum nextObject]))
		if ([[file lastPathComponent] isEqualToString:fname])
			return [path stringByAppendingPathComponent:file];
	return nil;
}

+ (NSString *) pathForDocumentNamed: (NSString *) fname
{
	return [NSFileManager pathForItemNamed:fname inFolder:NSDocumentsFolder()];
}

+ (NSString *) pathForBundleDocumentNamed: (NSString *) fname
{
	return [NSFileManager pathForItemNamed:fname inFolder:NSBundleFolder()];
}

+ (NSArray *) filesInFolder: (NSString *) path
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while ((file = [dirEnum nextObject]))
	{
		BOOL isDir;
		[[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:file] isDirectory: &isDir];
		if (!isDir) [results addObject:file];
	}
	return results;
}

// Case insensitive compare, with deep enumeration
+ (NSArray *) pathsForItemsMatchingExtension: (NSString *) ext inFolder: (NSString *) path
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while ((file = [dirEnum nextObject]))
		if ([[file pathExtension] caseInsensitiveCompare:ext] == NSOrderedSame)
			[results addObject:[path stringByAppendingPathComponent:file]];
	return results;
}

+ (NSArray *) pathsForDocumentsMatchingExtension: (NSString *) ext
{
	return [NSFileManager pathsForItemsMatchingExtension:ext inFolder:NSDocumentsFolder()];
}

// Case insensitive compare
+ (NSArray *) pathsForBundleDocumentsMatchingExtension: (NSString *) ext
{
	return [NSFileManager pathsForItemsMatchingExtension:ext inFolder:NSBundleFolder()];
}

#pragma mark - create dir method
+ (void)createDir:(NSString *)dir base:(NSString *)baseDir
{
    
    NSMutableString *path = [NSMutableString string];
    for (NSString *d in [dir componentsSeparatedByString:@"/"]) {
        [path appendString:[NSString stringWithFormat:@"/%@",d]];
        
        [[self class] createOneDir:path base:baseDir];
    }
}

+ (void)createOneDir:(NSString *)dir base:(NSString *)baseDir
{
    if ([dir isEqualToString:@""]) {
        return;
    }
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [baseDir stringByAppendingPathComponent:dir];//[documentsDirectory stringByAppendingPathComponent:dir];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]){
        NSError *error;
        
        if ([[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]) {
            NSLog(@"file ceated: %@",dataPath);
        }else{
            NSLog(@"when create %@,error:%@",dataPath,error);
        }
    }else{
        NSLog(@"file is already existed");
    }
}

#pragma mark - is dir exist method
+ (BOOL)isDirExist:(NSString *)dir base:(NSString *)baseDir
{
    if ([dir isEqualToString:@""]) {
        return FALSE;
    } 
    NSString *dataPath = [baseDir stringByAppendingPathComponent:dir];
    return [[NSFileManager defaultManager] fileExistsAtPath:dataPath];
}

#pragma mark - create dir wrapper

+ (void)createDirInDocuments:(NSString *)dir
{
    
    [[self class] createDir:dir base:NSDocumentsFolder()];
}

+ (void)createDirInLibrary:(NSString *)dir
{
    
    [[self class] createDir:dir base:NSLibraryFolder()];
}

+ (void)createDirInBundle:(NSString *)dir
{
    
    [[self class] createDir:dir base:NSBundleFolder()];
}

+ (void)createDirInTmp:(NSString *)dir
{
    
    [[self class] createDir:dir base:NSTmpFolder()];
}

+ (void)createDirInDCIM:(NSString *)dir
{
    
    [[self class] createDir:dir base:NSDCIMFolder()];
}

#pragma mark - delete dir wrapper

+ (BOOL)isDirExistInDocuments:(NSString *)dir
{
    return [[self class] isDirExist:dir base:NSDocumentsFolder()];
}

+ (BOOL)isDirExistInLibrary:(NSString *)dir
{
    return [[self class] isDirExist:dir base:NSLibraryFolder()];
}

+ (BOOL)isDirExistInBundle:(NSString *)dir
{
    return [[self class] isDirExist:dir base:NSBundleFolder()];
}

+ (BOOL)isDirExistInTmp:(NSString *)dir
{
    return [[self class] isDirExist:dir base:NSTmpFolder()];
}

+ (BOOL)isDirExistInDCIM:(NSString *)dir
{
    return [[self class] isDirExist:dir base:NSDCIMFolder()];
}

+ (NSMutableDictionary *)dum333p:(NSString *)dir 
{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    NSMutableString *str = [NSMutableString string];
    
    NSError * error;
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error:&error];
    
    for (NSString *s in directoryContents) {
        NSString *path = [NSString stringWithFormat:@"%@/%@",dir,s];
        
        BOOL isDir;
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
        
        if (fileExists)
        {
            if (isDir) {
//                [[self class] dump:path];
//                [self du]
                path = [path stringByReplacingOccurrencesOfString:NSDocumentsFolder() withString:@""];
//                NSLog(@"Folder already exists...:%@\n",path);
                 [str appendFormat:@"%@,",path];
            }else{
                path = [path stringByReplacingOccurrencesOfString:NSDocumentsFolder() withString:@""];
//                NSLog(@"it's a file:%@\n\n",path);
                
                [str appendFormat:@"%@,",path];
            }
            
        }
        
        
        
//        path = [path stringByReplacingOccurrencesOfString:NSDocumentsFolder() withString:@""];
//        NSLog(@"%@\n\n",path);

    }
    
    NSLog(@"%@\n\n",str);
}

/**
 todo：打印出给定目录的所有内容
 */
+ (NSMutableString *)dump:(NSString *)dir  base:(NSString *)baseDir
{  
    NSMutableString *str = [NSMutableString string];
    NSMutableString *prefix_str = [NSMutableString string];
    
    NSString *spliteStr = @"├── ";

    NSArray *dirArray = [[dir stringByReplacingOccurrencesOfString:baseDir withString:@""] componentsSeparatedByString:@"/"];
    
    NSMutableArray *tmp = [NSMutableArray arrayWithArray:dirArray];
    
    for (NSString *d in dirArray) {
        if (d == nil || [d isEqualToString:@""]) {
            [tmp removeObject:d];
        }
    }
    
    
    
    int dirCount = [tmp count];
    
    if (dirCount > 0) {
        
        for (int i = 0; i < dirCount; i++) {
            if (i == dirCount - 1) {
                
                [str appendFormat:@"%@",spliteStr];
            }else{
                [str appendFormat:@"│   "];
            }
        }
        
        
    }else{
        [str appendFormat:@".\n"];
    }
    
    
    
    NSError * error;
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error:&error];
    
    for (NSString *s in directoryContents) {
        NSString *path = [NSString stringWithFormat:@"%@/%@",dir,s]; 
        
  
        
        BOOL isDir;
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
        
        if (fileExists)
        {
            if (isDir) {
                NSMutableString *substr = [[self class] dump:path base:baseDir];
                path = [path stringByReplacingOccurrencesOfString:NSDocumentsFolder() withString:@""];
                //                NSLog(@"Folder already exists...:%@\n",path);
                [str appendFormat:@"%@%@\n",spliteStr,[s stringByReplacingOccurrencesOfString:@"/" withString:@""]];
                [str appendFormat:@"%@,",substr];
            }else{
                path = [path stringByReplacingOccurrencesOfString:NSDocumentsFolder() withString:@""];
                //                NSLog(@"it's a file:%@\n\n",path);
                
                [str appendFormat:@"%@%@\n",spliteStr,[s stringByReplacingOccurrencesOfString:@"/" withString:@""]];
            }
        }
    }
    
//    NSLog(@"%@\n\n",str);
    
    return str;
}


@end

