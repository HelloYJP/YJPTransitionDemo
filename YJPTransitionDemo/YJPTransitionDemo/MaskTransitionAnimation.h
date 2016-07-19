//
//  MaskTransitionAnimation.h
//  动画_test
//
//  Created by YangJingping on 16/7/13.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,MaskTransitionType)
{
    MaskTransitionPush = 1,
    MaskTransitionPop
};

@interface MaskTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+(instancetype)transitionWithType:(MaskTransitionType )type;
-(instancetype)initWithTransitionType:(MaskTransitionType )type;

@end
