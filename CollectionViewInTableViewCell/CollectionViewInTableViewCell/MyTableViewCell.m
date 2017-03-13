//
//  MyTableViewCell.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyTableViewCell.h"
#import "MyCollectionViewCell.h"
#define photoMargin 5

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _myTitle.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    _myContent.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat size = ([UIScreen mainScreen].bounds.size.width - 20 - photoMargin * 2) / 3;
    self.layout.itemSize = CGSizeMake(size,size);
    self.layout.minimumLineSpacing = photoMargin;
    self.layout.minimumInteritemSpacing = photoMargin;
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _myTitle.text = data[@"title"];
    _myContent.text = data[@"content"];
//    [self setCollectionViewSize:data];
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
        if (images.count <= 3) {    // 1 line
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
    CGFloat height = CGRectGetMaxY(self.collectionView.frame);
    return height;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *images = self.data[@"images"];
    return images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *images = self.data[@"images"];
     MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageName = images[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
