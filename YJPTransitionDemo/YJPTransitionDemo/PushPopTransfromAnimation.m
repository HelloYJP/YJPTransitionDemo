//
//  PushPopTransfromAnimation.m
//  动画_test
//
//  Created by YangJingping on 16/7/7.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "PushPopTransfromAnimation.h"
#import "CollectionViewController.h"
#import "PushedViewController.h"
#import "MyCollectionViewCell.h"

@interface PushPopTransfromAnimation()

@property(nonatomic,assign)PushPopTransformType type;

@end

@implementation PushPopTransfromAnimation


-(instancetype)initWithTransformType:(PushPopTransformType )type
{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

+(instancetype)transformWithType:(PushPopTransformType )type
{
    return [[self alloc] initWithTransformType:type];
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (_type == PushPopTransformPush) {
        
        [self pushAnimation:transitionContext];
    }
    else if (_type == PushPopTransformPop)
    {
        [self popAnimation:transitionContext];
    }
}


/**
 *  假设：从第一个页面push到第二个页面
 *  不管push还是pop，fromVC的view会自动添加到containerView上，但是toVC的view需要自己添加
 *  
 *  push：fromVC就是第一个页面，toVC就是第二个页面
 *  pop ：toVC就是第一个页面，fromVC就是第二个页面
 */

#pragma mark -
-(void)pushAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    //1.
    CollectionViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    PushedViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[fromVC.collectionView cellForItemAtIndexPath:fromVC.indexPath];
    
    //2.
    UIView *containerView = [transitionContext containerView];
    
    //
    UIView *tempView = [cell.myImgView snapshotViewAfterScreenUpdates:NO];
    tempView.frame  =[cell.myImgView convertRect:cell.myImgView.frame toView:containerView];
    
    toVC.view.alpha = 0;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    toVC.imgView.hidden = YES;

    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        
        tempView.frame  = [toVC.imgView convertRect:toVC.imgView.bounds toView:containerView] ;
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        
        toVC.imgView.hidden = NO;
        [tempView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
}


-(void)popAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    //1.
    PushedViewController *fromVC = (PushedViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CollectionViewController *toVC = (CollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    
    //2.
    UIView *containerView = [transitionContext containerView];
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.indexPath];
    CGRect cellInitRect = [cell.myImgView convertRect:cell.myImgView.frame toView:containerView];
    
    UIView *temp = fromVC.imgView;
    
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];


    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:0 animations:^{
        
        temp.frame = cellInitRect;
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
//
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}


@end
