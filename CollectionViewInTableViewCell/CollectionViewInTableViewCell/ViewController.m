//
//  ViewController.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "MyCollectionViewCell.h"
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) NSMutableArray *datas;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Datas.plist" ofType:nil];
    self.datas = [NSMutableArray arrayWithContentsOfFile:path];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.data = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return  [cell rowHeight:self.datas[indexPath.row]];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(MyTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSDictionary *dic = self.datas[[(PhotoCollectionView *)collectionView indexPath].row];
    NSArray *images = dic[@"images"];
    return images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.datas[[(PhotoCollectionView *)collectionView indexPath].row];

    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *images = dic[@"images"];
    cell.imageName = images[indexPath.row];
    return cell;
}

@end
