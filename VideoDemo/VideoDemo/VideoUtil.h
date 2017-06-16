//
//  VideoUtil.h
//  VideoUtil
//
//  Created by Heisenbean on 2017/6/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface VideoUtil : NSObject
- (void)getVideoInfoFromLink:(NSString *)link callback:(void(^) (NSDictionary *dic))callback;
@end
