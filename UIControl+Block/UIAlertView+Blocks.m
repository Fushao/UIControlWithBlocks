//
//  UIAlertView+Blocks.m
//  Block
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static void *BlockKey   = @"BlockKey";

@interface UIAlertView () <UIAlertViewDelegate>

@end

@implementation UIAlertView (Blocks)

- (void)cb_setBlock:(AlertViewBlock)block
{
    self.delegate = self;
    objc_setAssociatedObject(self, BlockKey, block, OBJC_ASSOCIATION_COPY);
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AlertViewBlock block = objc_getAssociatedObject(self, BlockKey);
    block(buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
}

@end
