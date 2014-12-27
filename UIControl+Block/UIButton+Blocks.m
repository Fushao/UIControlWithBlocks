//
//  UIButton+Blocks.m
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UIButton+Blocks.h"
#import <objc/runtime.h>

static void *BlockKey   = @"BlockKey";

@implementation UIButton (Blocks)

- (void)cb_setBlock:(ButtonBlock)block
{
    objc_setAssociatedObject(self, BlockKey, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(buttonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTouchUpInside
{
    ButtonBlock block = objc_getAssociatedObject(self, BlockKey);
    block();
}

@end
