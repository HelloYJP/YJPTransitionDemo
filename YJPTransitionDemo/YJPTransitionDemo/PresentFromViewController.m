//
//  PresentFromViewController.m
//  动画_test
//
//  Created by YangJingping on 16/6/28.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "PresentFromViewController.h"
#import "TransFromAnimation.h"
#import "PresentToViewController.h"
#import "SwipeViewController.h"

@interface PresentFromViewController ()<UIViewControllerTransitioningDelegate,PresentToViewControllerDelegate>

@property(nonatomic,strong)TransFromAnimation *presentAnimation;
@property(nonatomic,strong)TransFromAnimation *dismissAnimation;
@property(nonatomic,strong)SwipeViewController *swipeVC;

@end

@implementation PresentFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"FromVC";
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    self.presentAnimation = [TransFromAnimation transfromWithAnimationType:YJPPresentAnimationPresent];
    
    self.dismissAnimation = [TransFromAnimation transfromWithAnimationType:YJPPresentAnimationDismiss];
    
    self.swipeVC = [SwipeViewController new];
    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x-50, 100, 100, 100)];
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"点击" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonAction
{
    
    PresentToViewController *presentToVC=[[PresentToViewController alloc]init];
    presentToVC.transitioningDelegate=self;
    presentToVC.delegate=self;
    [self.swipeVC handleDismissViewController:presentToVC];
    //1.UIModalPresentationCustom模式下，fromVC视图不消失
    //  注意：custom模式下,presenting不消失;fullScreen消失（默认）
    //2.自定义转场时，决定转场动画效果的modalTransitionStyle属性将被忽略
//    presentToVC.modalPresentationStyle = UIModalPresentationCustom;
//    presentToVC.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:presentToVC animated:YES completion:nil];
}

-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.swipeVC.interacting ? self.swipeVC : nil;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
