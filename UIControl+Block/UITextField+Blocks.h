//
//  UITextField+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TextFieldTextChangedBlock)(NSString *text);
typedef void (^TextFieldBeginEditingBlock)(NSString *text);
typedef void (^TextFieldEndEditingBlock)(NSString *text);

@interface UITextField (Blocks)

- (void)cb_setTextChangedBlock:(TextFieldTextChangedBlock)block;
- (void)cb_setBeginEditingBlock:(TextFieldBeginEditingBlock)block;
- (void)cb_setEndEditingBlock:(TextFieldEndEditingBlock)block;

@end
