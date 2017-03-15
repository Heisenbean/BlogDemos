//
//  TextViewCell.h
//  UITextViewInTableViewCell
//
//  Created by Heisenbean on 2017/3/15.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TextViewCell;
@protocol TextViewCellDelegate <NSObject>
@optional
- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text;

@end
@interface TextViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) id<TextViewCellDelegate> delegate;

@end

