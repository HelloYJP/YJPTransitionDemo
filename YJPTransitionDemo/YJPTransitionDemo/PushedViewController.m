//
//  PushedViewController.m
//  动画_test
//
//  Created by YangJingping on 16/7/7.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "PushedViewController.h"
#import "PushPopTransfromAnimation.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"pushed VC";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(backAction)];
    
    
    UIImageView *imgView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 270)];
    imgView.center = self.view.center;
    imgView.image  = [UIImage imageNamed:@"star.jpg"] ;
    [self.view addSubview:imgView];
    self.imgView = imgView;
    
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    return [PushPopTransfromAnimation transformWithType:(operation == UINavigationControllerOperationPush ? PushPopTransformPush :PushPopTransformPop)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
