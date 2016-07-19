//
//  PresentToViewController.m
//  动画_test
//
//  Created by YangJingping on 16/6/28.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "PresentToViewController.h"

@interface PresentToViewController ()

@property(nonatomic,strong)UIButton *disBtn;

@end

@implementation PresentToViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"ToVC";
    
    self.view.backgroundColor=[UIColor orangeColor];
    
    [self configUI];
    
}

//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    NSLog(@"viewDidAppear");
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        self.inputText.frame = CGRectMake(70, 80, 160, 30);
//        self.disBtn.alpha = 1;
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//}


- (void)configUI
{
    NSLog(@"viewdidload");
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    button.backgroundColor=[UIColor grayColor];
    [button setTitle:@"dismiss" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(dismissAction) forControlEvents:(UIControlEventTouchUpInside)];
    button.layer.cornerRadius = 25;
    [self.view addSubview:button];
    self.disBtn = button;
    
}


-(void)dismissAction
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismiss)]) {
        [self.delegate dismiss];
    }
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
