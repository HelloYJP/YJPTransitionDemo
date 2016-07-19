//
//  MaskedViewController.m
//  动画_test
//
//  Created by YangJingping on 16/7/13.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "MaskedViewController.h"
#import "MaskTransitionAnimation.h"

@interface MaskedViewController ()

@end

@implementation MaskedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor orangeColor];
    
    self.navigationItem.title =@"第二页";
    
    [self configUI];
    
    // Do any additional setup after loading the view.
}

-(void)configUI
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30, 80, 50, 50)];
    button.layer.cornerRadius = 25;
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    self.button = button;
    
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 250)];
    imgView.center =self.view.center;
    imgView.image = [UIImage imageNamed:@"star.jpg"];
    [self.view addSubview:imgView];
    
}

-(void)buttonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    
    return [MaskTransitionAnimation  transitionWithType:(operation == UINavigationControllerOperationPush)? MaskTransitionPush:MaskTransitionPop];
    
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
