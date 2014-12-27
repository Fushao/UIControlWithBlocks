//
//  UISwitch+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SwitchBlock)(BOOL isOn);

@interface UISwitch (Blocks)

- (void)cb_setBlock:(SwitchBlock)block;

@end
