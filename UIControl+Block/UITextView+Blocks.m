//
//  UITextView+Blocks.m
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UITextView+Blocks.h"
#import <objc/runtime.h>

static void *TextChangedBlockKey   = @"TextChangedBlockKey";
static void *BeginEditingBlockKey   = @"BeginEditingBlockKey";
static void *EndEditingBlockKey = @"EndEditingBlockKey";

@implementation UITextView (Blocks)

- (void)cb_setTextChangedBlock:(TextViewBeginEditingBlock)block
{
    objc_setAssociatedObject(self, TextChangedBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)cb_setBeginEditingBlock:(TextViewBeginEditingBlock)block
{
    objc_setAssociatedObject(self, BeginEditingBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEdit:) name:UITextViewTextDidBeginEditingNotification object:nil];
}

- (void)cb_setEndEditingBlock:(TextViewEndEditingBlock)block
{
    objc_setAssociatedObject(self, EndEditingBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEdit:) name:UITextViewTextDidEndEditingNotification object:nil];
}

- (void)valueChanged:(NSNotification *)notification
{
    if (notification.object == self) {
        TextViewTextChangedBlock block = objc_getAssociatedObject(self, TextChangedBlockKey);
        block(self.text);
    }
}

- (void)beginEdit:(NSNotification *)notification
{
    if (notification.object == self) {
        TextViewBeginEditingBlock block = objc_getAssociatedObject(self, BeginEditingBlockKey);
        block(self.text);
    }
}

- (void)endEdit:(NSNotification *)notification
{
    if (notification.object == self) {
        TextViewEndEditingBlock block = objc_getAssociatedObject(self, EndEditingBlockKey);
        block(self.text);
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
