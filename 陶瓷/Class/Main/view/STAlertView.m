//
//  STAlertView.m
//  GDSASYS
//
//  Created by 戈王 on 15/4/25.
//  Copyright (c) 2015年 Smart-Array. All rights reserved.
//

#import "STAlertView.h"

@implementation STAlertView

+ (void)st_promptAlertWithMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"提示", nil)
                                                        message:message
                                                       delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
        
        [alert show];
    });
}


@end
