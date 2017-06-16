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

@property (weak, nonatomic) IBOutlet UILabel *myContent;
@property (weak, nonatomic) IBOutlet UIButton *headIcon;
@property (weak, nonatomic) IBOutlet PhotoCollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *videoContentView;
@property (weak, nonatomic) IBOutlet UIView *outlinkContentView;
@property (weak, nonatomic) IBOutlet UILabel *outlinkTitle;
@property (weak, nonatomic) IBOutlet UIImageView *outlinkFace;
@property (strong,nonatomic) NSDictionary *data;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *outlinkContentViewHeightConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationViewTopConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *videoViewToLinkViewTopConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoViewToLinkViewTopConst;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *videoHeightConst;
@property (weak, nonatomic) IBOutlet UIView *cellLineView;
@property (weak, nonatomic) IBOutlet UIView *tagView;
- (CGFloat)rowHeight:(NSDictionary *)data;
- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
