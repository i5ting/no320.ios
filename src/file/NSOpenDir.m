//
//  NSOpenDir.m
//  no320
//
//  Created by sang alfred on 10/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "NSOpenDir.h"

#define NotDevice (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

#pragma mark - ctring extend

int string_with_replace(char* str,char* str_src, char* str_des){
    char *ptr=NULL;
    char buff[256];
    char buff2[256];
    int i = 0;
    
    if(str != NULL){
        strcpy(buff2, str);
    }else{
        printf("str_replace err!\n");
        return -1;
    }
    memset(buff, 0x00, sizeof(buff));
    while((ptr = strstr( buff2, str_src)) !=0){
        if(ptr-buff2 != 0) memcpy(&buff[i], buff2, ptr - buff2);
        memcpy(&buff[i + ptr - buff2], str_des, strlen(str_des));
        i += ptr - buff2 + strlen(str_des);
        strcpy(buff2, ptr + strlen(str_src));
    }
    strcat(buff,buff2);
    strcpy(str,buff);
    return 0;
}

#pragma mark - path utils

NSString *NSDocumentsFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

NSString *NSLibraryFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
}

NSString *NSTmpFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

NSString *NSBundleFolder()
{
	return [[NSBundle mainBundle] bundlePath];
}

NSString *NSDCIMFolder()
{
	return @"/var/mobile/Media/DCIM";
}

#pragma mark - open dir

void NSOpenDir(NSString *path)
{
    if (NotDevice) {
        path = [path stringByReplacingOccurrencesOfString:@" " withString:@"#"];
        NSString *cmd = [NSString stringWithFormat:@"open %@",path];
        
        char *str =(char *) [cmd cStringUsingEncoding:NSUTF8StringEncoding];
        string_with_replace(str, "#", "\\ ");
        
        NSLog(@"INFO: NSOpenDir already %s",str);
        system(str);
    }else{
        NSLog(@"INFO: Device not support NSOpenDir");
    }
}

void NSOpenHome()
{
    NSOpenDir(NSHomeDirectory());
}
