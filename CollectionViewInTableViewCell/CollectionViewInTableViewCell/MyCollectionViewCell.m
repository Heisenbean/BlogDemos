//
//  MyCollectionViewCell.m
//  collectionViewDemo
//
//  Created by Heisenbean on 2017/3/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (void)setImageName:(NSString *)imageName{
    [_myImageView setImage:[UIImage imageNamed:imageName]];
}
@end
