//
//  FileTest.m
//  no320
//
//  Created by sang alfred on 10/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "FileTest.h"



@implementation FileTest


- (void)testOpenHomeDir
{
    NSOpenHome();
}

- (void)testOpenDocumentsDir
{
    NSOpenDir(NSDocumentsFolder());
}

@end
