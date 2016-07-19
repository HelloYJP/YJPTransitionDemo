//
//  ViewController.m
//  YJPTransitionDemo
//
//  Created by YangJingping on 16/7/18.
//  Copyright © 2016年 YJP. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "PresentFromViewController.h"
#import "SystemViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"转场";
    
    [self configUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)configUI
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate =self;
    tableView.dataSource= self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mycell"];
    [self.view addSubview:tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text =@"神奇移动";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"手势";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"扩散";
    }
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
        
        [self.navigationController pushViewController:collectionVC animated:YES];
    }
    else if (indexPath.row == 1) {
        PresentFromViewController *presentVC = [[PresentFromViewController alloc]init];
        
        [self.navigationController pushViewController:presentVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        SystemViewController *systemVC = [[SystemViewController alloc]init];
        
        [self.navigationController pushViewController: systemVC animated:YES];
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
