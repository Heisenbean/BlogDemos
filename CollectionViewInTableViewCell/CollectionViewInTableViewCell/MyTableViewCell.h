//
//  MyTableViewCell.h
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PhotoCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myTitle;
@property (weak, nonatomic) IBOutlet UILabel *myContent;
@property (weak, nonatomic) IBOutlet PhotoCollectionView *collectionView;
@property (strong,nonatomic) NSDictionary *data;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConst;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
- (CGFloat)rowHeight:(NSDictionary *)data;
- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
