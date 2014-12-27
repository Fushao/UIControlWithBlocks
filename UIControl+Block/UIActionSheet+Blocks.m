//
//  UIActionSheet+Blocks.m
//  Block
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static void *BlockKey   = @"BlockKey";

@interface UIActionSheet ()<UIActionSheetDelegate>

@end

@implementation UIActionSheet (Blocks)

- (void)cb_setBlock:(ActionSheetBlock)block
{
    self.delegate = self;
    objc_setAssociatedObject(self, BlockKey, block, OBJC_ASSOCIATION_COPY);
}

#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ActionSheetBlock block = objc_getAssociatedObject(self, BlockKey);
    block(buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
}

@end
