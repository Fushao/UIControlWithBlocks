//
//  UIStepper+Blocks.m
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UIStepper+Blocks.h"
#import <objc/runtime.h>

static void *BlockKey   = @"BlockKey";


@implementation UIStepper (Blocks)

- (void)cb_setBlock:(StepperBlock)block
{
    objc_setAssociatedObject(self, BlockKey, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged
{
    StepperBlock block = objc_getAssociatedObject(self, BlockKey);
    block(self.value);
}

@end
