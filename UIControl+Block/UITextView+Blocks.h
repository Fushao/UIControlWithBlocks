//
//  UITextView+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^TextViewTextChangedBlock)(NSString *text);
typedef void (^TextViewBeginEditingBlock)(NSString *text);
typedef void (^TextViewEndEditingBlock)(NSString *text);


@interface UITextView (Blocks)

- (void)cb_setTextChangedBlock:(TextViewTextChangedBlock)block;
- (void)cb_setBeginEditingBlock:(TextViewBeginEditingBlock)block;
- (void)cb_setEndEditingBlock:(TextViewEndEditingBlock)block;

@end
