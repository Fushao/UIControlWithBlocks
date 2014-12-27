//
//  UIPageControl+Blocks.h
//  UIControlWithBlocks
//
//  Created by Fushao on 14/12/27.
//  Copyright (c) 2014年 Fushao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PageControlBlock)(NSUInteger currentPage, NSUInteger numberOfPages);

@interface UIPageControl (Blocks)

- (void)cb_setBlock:(PageControlBlock)block;

@end
