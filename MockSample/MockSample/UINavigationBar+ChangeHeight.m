//
//  UINavigationBar+ChangeHeight.m
//  MockSample
//
//  Created by ist_spu on 2013/11/13.
//  Copyright (c) 2013年 YUKO Fujii. All rights reserved.
//

#import "UINavigationBar+ChangeHeight.h"

@implementation UINavigationBar (ChangeHeight)

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = CGSizeMake(self.frame.size.width,CONST_NAVIGATIONBAR_HEIGHT);
    return newSize;
}

@end
