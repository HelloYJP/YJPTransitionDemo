//
//  SystemViewController.m
//  动画_test
//
//  Created by YangJingping on 16/7/13.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "SystemViewController.h"
#import "MaskedViewController.h"

@interface SystemViewController ()

@end

@implementation SystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"第一页";
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self configUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)configUI
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30, 80, 50, 50)];
    button.layer.cornerRadius = 25;
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    self.button = button;
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 250)];
    imgView.center =self.view.center;
    imgView.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:imgView];
    

}

-(void)buttonAction
{
    MaskedViewController *maskedVC = [[MaskedViewController alloc]init];
    
    self.navigationController.delegate = maskedVC;
    
    [self.navigationController pushViewController:maskedVC animated:YES];

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
