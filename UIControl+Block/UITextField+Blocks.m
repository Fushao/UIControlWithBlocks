//
//  UITextField+Blocks.m
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import "UITextField+Blocks.h"
#import <objc/runtime.h>

static void *TextChangedBlockKey   = @"TextChangedBlockKey";
static void *BeginEditingBlockKey   = @"BeginEditingBlockKey";
static void *EndEditingBlockKey = @"EndEditingBlockKey";

@implementation UITextField (Blocks)

- (void)cb_setTextChangedBlock:(TextFieldTextChangedBlock)block
{
    objc_setAssociatedObject(self, TextChangedBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)cb_setBeginEditingBlock:(TextFieldBeginEditingBlock)block
{
    objc_setAssociatedObject(self, BeginEditingBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEdit:) name:UITextFieldTextDidBeginEditingNotification object:nil];
}

- (void)cb_setEndEditingBlock:(TextFieldEndEditingBlock)block
{
    objc_setAssociatedObject(self, EndEditingBlockKey, block, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEdit:) name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (void)valueChanged:(NSNotification *)notification
{
    if (notification.object == self) {
        TextFieldTextChangedBlock block = objc_getAssociatedObject(self, TextChangedBlockKey);
        block(self.text);
    }
}

- (void)beginEdit:(NSNotification *)notification
{
    if (notification.object == self) {
        TextFieldBeginEditingBlock block = objc_getAssociatedObject(self, BeginEditingBlockKey);
        block(self.text);
    }
}

- (void)endEdit:(NSNotification *)notification
{
    if (notification.object == self) {
        TextFieldEndEditingBlock block = objc_getAssociatedObject(self, EndEditingBlockKey);
        block(self.text);
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
