//
//  UIImage+iOS6and7.m
//  01-weibo
//
//  Created by 王戈 on 14-7-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+iOS6and7.h"

@implementation UIImage (iOS6and7)
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (YES) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageWithName:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
