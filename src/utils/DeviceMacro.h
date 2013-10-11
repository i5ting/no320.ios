//
//  DeviceMacro.h
//  no320
//
//  Created by sang alfred on 10/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)
