//
//  MaskTransitionAnimation.m
//  动画_test
//
//  Created by YangJingping on 16/7/13.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "MaskTransitionAnimation.h"
#import "SystemViewController.h"
#import "MaskedViewController.h"

@interface MaskTransitionAnimation ()

@property(nonatomic,assign)MaskTransitionType type;
@property(nonatomic,weak)id <UIViewControllerContextTransitioning> transitionContext;

@end


@implementation MaskTransitionAnimation


+(instancetype)transitionWithType:(MaskTransitionType )type
{
    return  [[self alloc]initWithTransitionType:type];
}
-(instancetype)initWithTransitionType:(MaskTransitionType )type
{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{

    if (_type == MaskTransitionPush) {
        [self pushAnimaiton:transitionContext];
    }
    else if (_type == MaskTransitionPop)
    {
        [self popAnimaiton:transitionContext];
    }

}

/**
    注意：mask设置的都是第二页（pushed页）
 */


-(void)pushAnimaiton:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //1.
    self.transitionContext = transitionContext;
    
    
    MaskedViewController *toVC  = (MaskedViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    UIView *containerView = [transitionContext containerView];
    
    //3.
    [containerView addSubview:toVC.view];

    
    //4.
    UIButton *button = toVC.button;
    CGFloat x =toVC.view.frame.size.width - button.center.x;
    CGFloat y =toVC.view.frame.size.height - button.center.y;
    CGFloat radius =sqrt(x*x+y*y);

    UIBezierPath  *initPath = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    UIBezierPath  *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];

    
    //5.
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.path = finalPath.CGPath;
    toVC.view.layer.mask = shaperLayer;
    
    
    //6.
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    baseAnimation.fromValue = (id)initPath.CGPath;
    baseAnimation.toValue = (id)finalPath.CGPath;
    baseAnimation.duration = [self transitionDuration:transitionContext];
    baseAnimation.delegate =self;
    [shaperLayer addAnimation:baseAnimation forKey:nil];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    if (_type == MaskTransitionPush) {
        [self.transitionContext completeTransition:YES];
        [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    }
    else if (_type == MaskTransitionPop)
    {
        [self.transitionContext completeTransition:YES];
        [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    }

}

-(void)popAnimaiton:(id <UIViewControllerContextTransitioning>)transitionContext
{

    //1.
    self.transitionContext = transitionContext;

    //2.
    MaskedViewController *fromVC= (MaskedViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //
    SystemViewController *toVC  = (SystemViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    UIButton *button = fromVC.button;

    UIView *containerView = [transitionContext containerView];
 
    
    //3.
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    //4.
    CGFloat x =fromVC.view.frame.size.width - button.center.x;
    CGFloat y =fromVC.view.frame.size.height - button.center.y;
    CGFloat radius =sqrt(x*x+y*y);
    
    UIBezierPath  *initPath = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    UIBezierPath  *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    
    //5.
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.path = initPath.CGPath;
    fromVC.view.layer.mask = shaperLayer;
    
    
    //6.
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    baseAnimation.fromValue = (id)finalPath.CGPath;
    baseAnimation.toValue =(id)initPath.CGPath;
    baseAnimation.duration = [self transitionDuration:transitionContext];
    baseAnimation.delegate =self;
    [shaperLayer addAnimation:baseAnimation forKey:nil];
        
}

@end
