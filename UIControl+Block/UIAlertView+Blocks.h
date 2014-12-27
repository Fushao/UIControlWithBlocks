//
//  UIAlertView+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertViewBlock)(NSInteger buttonIndex, NSString *buttonTitle);

@interface UIAlertView (Blocks)

- (void)cb_setBlock:(AlertViewBlock)block;

@end
