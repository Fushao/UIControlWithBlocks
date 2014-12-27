//
//  UIPageControl+Blocks.m
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UIPageControl+Blocks.h"
#import <objc/runtime.h>

static void *BlockKey   = @"BlockKey";


@implementation UIPageControl (Blocks)

- (void)cb_setBlock:(PageControlBlock)block
{
    objc_setAssociatedObject(self, BlockKey, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged
{
    PageControlBlock block = objc_getAssociatedObject(self, BlockKey);
    block(self.currentPage, self.numberOfPages);
}

@end
