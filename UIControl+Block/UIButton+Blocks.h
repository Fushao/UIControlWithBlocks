//
//  UIButton+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)();

@interface UIButton (Blocks)

- (void)cb_setBlock:(ButtonBlock)block;

@end
