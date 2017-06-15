//
//  MyCollectionViewCell.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "UIImageView+BetterFace.h"
@implementation MyCollectionViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setImageName:(NSString *)imageName{
//    [_myImageView setContentMode:UIViewContentModeScaleAspectFill];
//    [_myImageView setNeedsBetterFace:YES];
//    [_myImageView setFast:YES];
    [_myImageView setImage:[UIImage imageNamed:imageName]];
}
@end
