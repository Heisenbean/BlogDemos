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

-  (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubView];
    }
    return self;
}

- (void) setupSubView{
    
}


- (void)setImageName:(NSString *)imageName{
    [_myImageView setContentMode:UIViewContentModeScaleAspectFill];
    [_myImageView setNeedsBetterFace:YES];
    [_myImageView setFast:YES];
    [_myImageView setBetterFaceImage:[UIImage imageNamed:imageName]];
}
@end
