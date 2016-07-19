//
//  PushPopTransfromAnimation.h
//  动画_test
//
//  Created by YangJingping on 16/7/7.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,PushPopTransformType) {
    PushPopTransformPush = 0,
    PushPopTransformPop
};

@interface PushPopTransfromAnimation : NSObject<UIViewControllerAnimatedTransitioning>


-(instancetype)initWithTransformType:(PushPopTransformType )type;
+(instancetype)transformWithType:(PushPopTransformType )type;


@end
