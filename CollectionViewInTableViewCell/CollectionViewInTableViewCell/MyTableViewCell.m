//
//  MyTableViewCell.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyTableViewCell.h"
#import "MyCollectionViewCell.h"
#define photoMargin 6
@implementation PhotoCollectionView

@end
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _myTitle.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    _myContent.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _myTitle.text = data[@"title"];
    _myContent.text = data[@"content"];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setCollectionViewSize:self.data];
}

- (void)setCollectionViewSize:(NSDictionary *)data{
    CGFloat singlePhotoSize = ([UIScreen mainScreen].bounds.size.width - 20 - photoMargin * 2) / 3;

    NSArray *images = data[@"images"];
    if (images.count == 0) {
            self.collectionViewHeightConst.constant = 0;
    }else{
        if (images.count == 1) {
            self.collectionViewHeightConst.constant = singlePhotoSize * 2 + photoMargin;
        }else if (images.count == 3 && images.count == 2) {    // 1 line
            self.collectionViewHeightConst.constant = singlePhotoSize;
        }else if(images.count > 3 && images.count <= 6){ // 2 line
            self.collectionViewHeightConst.constant = singlePhotoSize * 2 + photoMargin;
        }else{  // 3 line
            self.collectionViewHeightConst.constant = singlePhotoSize * 3 + photoMargin * 2;
        }
    }
}

- (CGFloat)rowHeight:(NSDictionary *)data{
    self.data = data;
    [self layoutIfNeeded];
    NSArray *images  = data[@"images"];
    if (images.count == 0) {
        return CGRectGetMaxY(self.myContent.frame);
    }else{
        return CGRectGetMaxY(self.collectionView.frame);
    }
}


- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    [self.collectionView reloadData];
}




@end
