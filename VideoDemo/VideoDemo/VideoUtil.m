//
//  VideoUtil.m
//  VideoTool
//
//  Created by Heisenbean on 2017/6/13.
//  Copyright © 2017年 Heisenbean. All rights reserved.
//

#import "VideoUtil.h"
#import "AFNetworking.h"
@implementation VideoUtil
- (void)getVideoInfoFromLink:(NSString *)link callback:(void(^) (NSDictionary *dic))callback{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/x-javascript"]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if ([link containsString:@"qq."]) {
        NSString *imageUrl = [NSString stringWithFormat:@"http://vpic.video.qq.com/%ld/%@.png",[self getPictureIdFromLink:link],[self getTencentVideoCidAndVidsFromLink:link].lastObject];
        dic[@"image"] = imageUrl;
        
        NSArray *array = [self getTencentVideoCidAndVidsFromLink:link];
        NSDictionary *parameters = @{@"otype":@"json",@"cid":array.firstObject,@"vids":array.lastObject};
        
        [manager GET:@"http://h5vv.video.qq.com/getinfo" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSDictionary *res = @{};
            NSString* jsonString = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"QZOutputJson=" withString:@""];
            NSString *newString = [jsonString substringToIndex:[jsonString length]-1];
            NSError *jsonError;
            NSData *objectData = [newString dataUsingEncoding:NSUTF8StringEncoding];
            res = [NSJSONSerialization JSONObjectWithData:objectData
                                                  options:NSJSONReadingMutableContainers
                                                    error:&jsonError];
            
            NSArray *array = res[@"vl"][@"vi"];
            dic[@"title"] = array.firstObject[@"ti"];
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(dic);
            });
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@",error.description);
            callback(nil);
        }];
        
    }else if([link containsString:@"youku."] || [link containsString:@"tudou."]){
        NSString *videoId = [self getYoukuVideoIdFromLink:link];
        [manager GET:@"https://api.youku.com/videos/show.json" parameters:@{@"client_id":@"1491b6a3b1c63cd4",@"video_id":videoId} success:^(AFHTTPRequestOperation * _Nonnull operation, _Nonnull id responseObject) {
            NSError *jsonError;
            NSDictionary *res = @{};
            res = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:NSJSONReadingMutableContainers
                                                    error:&jsonError];
            dic[@"title"] = res[@"title"];
            dic[@"image"] = res[@"bigThumbnail"];
            dic[@"link"] = res[@"link"];
            callback(dic);
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            callback(nil);
            NSLog(@"%@",error.description);
        }];
    }else if([link containsString:@"bilibili."]){
        NSDictionary *parameters = @{
                                     @"type":@"json",
                                     @"appkey":@"8e9fc618fbd41e28",
                                     @"id":[self getBilibiliVideoIdFromLink:link],
                                     @"page":@"1"};
        [manager GET:@"http://api.bilibili.com/view" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSError *jsonError;
            NSDictionary *res = @{};
            res = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:NSJSONReadingMutableContainers
                                                    error:&jsonError];
            dic[@"title"] = res[@"title"];
            dic[@"image"] = res[@"pic"];
            callback(dic);
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@",error.description);
            callback(nil);
        }];
    }else if ([link containsString:@"aiqiyi."]){
    
    }
    
}


- (NSString *)getYoukuVideoIdFromLink:(NSString *)link{
    NSURL *url = [NSURL URLWithString:link];
    NSString *lastPath = url.relativePath.stringByDeletingPathExtension.lastPathComponent;
    return  [lastPath stringByReplacingOccurrencesOfString:@"id_" withString:@""];
}

- (NSInteger)getPictureIdFromLink:(NSString *)link{
    NSInteger pid, e = 1e8;
    NSInteger h = 0;
    
    for (NSInteger g = 4294967296, i = 0; i < link.length; i++) {
        NSInteger j = [link characterAtIndex:i];
        h = 32 * h + h + j;
        h >= g && (h %= g);
    }
    return pid = h % e;
}

// first obj is cid, last obj is vids
- (NSArray<NSString *> *)getTencentVideoCidAndVidsFromLink:(NSString *)link{
    NSMutableArray *array = [NSMutableArray array];
    NSArray *temp = [link stringByDeletingPathExtension].pathComponents;
    [array addObject:temp[temp.count - 2]];
    [array addObject:temp.lastObject];
    return array;
}

- (NSString *)getBilibiliVideoIdFromLink:(NSString *)link{
    NSURL *url = [NSURL URLWithString:link];
    NSString *lastPath = url.lastPathComponent;
    return [lastPath stringByReplacingOccurrencesOfString:@"av" withString:@""];
}


@end
