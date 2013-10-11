//
//  cstring.m
//  no320
//
//  Created by sang alfred on 10/11/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "cstring.h"

/*
 * FUNCTION     : str_replace
 * ABSTRACT     : replace child string in a string.
 * PARAMETER    :
 *       char* str           the string that be replace
 *       char* str_src       source string
 *       char* str_des       destination string
 * RETURN       :
 *       0       OK
 *      -1       FALSE
 * NOTE         :
 */
int str_replace(char* str,char* str_src, char* str_des){
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
