//
//  NSOpenDir.h
//  no320
//
//  no dependency
//
//  Created by sang alfred on 10/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Path utils
NSString *NSDocumentsFolder(void);
NSString *NSLibraryFolder(void);
NSString *NSTmpFolder(void);
NSString *NSBundleFolder(void);
NSString *NSDCIMFolder(void);

/**
 * open application directory with path
 */
void NSOpenDir(NSString *path);

/**
 * open application home directory 
 */
void NSOpenHome();