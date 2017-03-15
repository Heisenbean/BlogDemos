//
//  TextViewCell.m
//  UITextViewInTableViewCell
//
//  Created by Heisenbean on 2017/3/15.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "TextViewCell.h"

@interface TextViewCell ()


@end

@implementation TextViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(textViewCell:didChangeText:)]) {
        [self.delegate textViewCell:self didChangeText:textView.text];
    }
    [textView sizeToFit];
    UITableView *tableView = [self tableView];
    [UIView setAnimationsEnabled:NO];
    [tableView beginUpdates];
    [tableView endUpdates];
    [UIView setAnimationsEnabled:YES];
}

- (UITableView *)tableView{
    UIView *tableView = self.superview;
    
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    
    return (UITableView *)tableView;
}


@end
