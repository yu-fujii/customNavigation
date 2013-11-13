//
//  YFColorManager.h
//  NavigationCustom
//
//  Created by 藤井 裕子 on 2013/10/05.
//  Copyright (c) 2013年 Yuko Fujii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Const.h"

@interface YFColorManager : NSObject
+ (UIImage *)createImageFromUIColor:(UIColor *)color;
+ (UIImage *)createImageFromUIColor:(UIColor *)color rectSize:(CGSize)size;

//- (UIImage *) _createImageFromUIColor:(UIColor *)color rectSize:(CGSize)size;
@end
