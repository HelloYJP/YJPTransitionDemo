//
//  CollectionViewController.m
//  动画_test
//
//  Created by YangJingping on 16/7/7.
//  Copyright © 2016年 YangJingping. All rights reserved.
//

#import "CollectionViewController.h"
#import "PushedViewController.h"
#import "MyCollectionViewCell.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize =  CGSizeMake(150, 120);
    
    
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"CollectionCell_id"];
    
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell_id" forIndexPath:indexPath];
    
    
    cell.backgroundColor = [UIColor grayColor];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PushedViewController *pushVC=[[PushedViewController alloc]init];
    self.indexPath = indexPath;
    self.navigationController.delegate = pushVC;
    [self.navigationController pushViewController:pushVC animated:YES];
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
