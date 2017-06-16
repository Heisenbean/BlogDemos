//
//  ViewController.m
//  VideoDemo
//
//  Created by Heisenbean on 2017/6/16.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "ViewController.h"
#import "VideoUtil.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)delete:(id)sender {
    self.urlTextField.text = nil;
}

- (IBAction)start:(UIButton *)sender {
    sender.enabled = NO;
    [[VideoUtil new] getVideoInfoFromLink:self.urlTextField.text callback:^(NSDictionary *dic) {
        if (dic) {
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:dic[@"image"]] placeholderImage:[UIImage imageNamed:@""]];
            self.videoTitle.text = dic[@"title"];
        }
        sender.enabled = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
