//
//  MyTableViewCell.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyTableViewCell.h"
#import "MyCollectionViewCell.h"
#import "UIView+LayoutMethods.h"
#define photoMargin 6
@implementation PhotoCollectionView

@end
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _myContent.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _myContent.text = data[@"content"];
    [_headIcon setBackgroundImage:[UIImage imageNamed:data[@"icon"]] forState:UIControlStateNormal];
    _nameLabel.text = data[@"name"];
    if (data[@"outlink"] && ![data[@"outlink"] isEqualToString:@""]) {
        _outlinkTitle.text = data[@"outlinkTitle"];
        _outlinkFace.image = [UIImage imageNamed:data[@"face"]];
    }
    
    if (data[@"video"] && ![data[@"video"] isEqualToString:@""]) {
        _videoImageView.image = [UIImage imageNamed:data[@"video"]];
    }
    [self setTags];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setCollectionViewSize:self.data];
    [self setContentsViewHeight:self.data];
}

- (void)setCollectionViewSize:(NSDictionary *)data{
    CGFloat singlePhotoSize = ([UIScreen mainScreen].bounds.size.width - 30 - photoMargin * 2) / 3;

    NSArray *images = data[@"images"];
    if (images.count == 0) {
            self.collectionViewHeightConst.constant = 0;
    }else{
        if (images.count == 1) {
            self.collectionViewHeightConst.constant = 215;
        }else if (images.count == 3 && images.count == 2) {    // 1 line
            self.collectionViewHeightConst.constant = singlePhotoSize;
        }else if(images.count > 3 && images.count <= 6){ // 2 line
            self.collectionViewHeightConst.constant = singlePhotoSize * 2 + photoMargin;
        }else{  // 3 line
            self.collectionViewHeightConst.constant = singlePhotoSize * 3 + photoMargin * 2;
        }
    }
    
    
}

- (void)setContentsViewHeight:(NSDictionary *)data{
    NSString *outlink = data[@"outlink"];
    NSString *video = data[@"video"];
    NSArray *images = data[@"images"];
    // outlink const
    if (!outlink || [outlink isEqualToString:@""]) {
        self.outlinkContentViewHeightConst.constant = 0;
        self.outlinkContentView.hidden = YES;
        self.videoViewToLinkViewTopConst.constant = 0;
        self.photoViewToLinkViewTopConst.constant = 0;
    }else{
       self.outlinkContentViewHeightConst.constant = 80;
        self.outlinkContentView.hidden = NO;
        self.videoViewToLinkViewTopConst.constant = 15;
        self.photoViewToLinkViewTopConst.constant = 15;
    }
    // video const
    if (video && ![video isEqualToString:@""]) {
        self.videoHeightConst.constant = 185;
        self.collectionViewHeightConst.constant = 185;
        self.videoContentView.hidden = NO;;
    }else{
        self.videoHeightConst.constant = 0;
        self.videoContentView.hidden = YES;
    }
    
    // location const
    // no video && no image && no outlink
    if ((!video || [video isEqualToString:@""]) && (images.count  == 0) && (!outlink || [outlink isEqualToString:@""])) {
        self.locationViewTopConst.constant = 0;
    }else{
        self.locationViewTopConst.constant = 20;
    }
}

- (void)setTags{
    NSString *tagStr = self.data[@"tags"];
    NSArray *tagArray = [tagStr componentsSeparatedByString:@","];
    for (UILabel *label in self.tagView.subviews) {
        [label removeFromSuperview];
    }
    [tagArray enumerateObjectsUsingBlock:^(NSString* str, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithWhite:164.0f / 255.0f alpha:1.0f];
        label.text = tagArray[idx];
        [label sizeToFit];
        [self.tagView addSubview:label];
        if (self.tagView.subviews.count > 1) {
            UILabel *l = self.tagView.subviews[idx -1];
            label.x = CGRectGetMaxX(l.frame) + 5;
        }
    }];
}


- (CGFloat)rowHeight:(NSDictionary *)data{
    self.data = data;
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.cellLineView.frame);
//    NSArray *images  = data[@"images"];
//    if (images.count == 0) {
//        return CGRectGetMaxY(self.myContent.frame);
//    }else{
//        return CGRectGetMaxY(self.collectionView.frame);
//    }
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
