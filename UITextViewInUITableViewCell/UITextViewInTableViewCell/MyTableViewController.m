//
//  MyTableViewController.m
//  UITextViewInTableViewCell
//
//  Created by Heisenbean on 2017/3/15.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyTableViewController.h"
#import "TextViewCell.h"
@interface MyTableViewController ()<TextViewCellDelegate>
@property (strong,nonatomic) NSMutableArray *datas;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 100;

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    NSUInteger datasCount = 15;
    self.datas = [NSMutableArray arrayWithCapacity:datasCount];
    for (NSUInteger i = 0; i < datasCount; i++) {
        [self.datas addObject:[NSString stringWithFormat:@"Cell%ld",i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableArray *data = [self.datas mutableCopy];
    data[indexPath.row] = text;
    self.datas = [data copy];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.textView.text = self.datas[indexPath.row];
    return cell;
}

@end
