//
//  PresentToViewController.h
//  动画_test
//
//  Created by YangJingping on 16/6/28.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PresentToViewControllerDelegate <NSObject>

-(void)dismiss;

@end

@interface PresentToViewController : UIViewController

@property(nonatomic,weak)id<PresentToViewControllerDelegate> delegate;

@end
