//
//  UIImageView+WDYWebImage.m
//  YMJD_WebImage
//
//  Created by mac on 2019/2/18.
//  Copyright © 2019 伟东云教育. All rights reserved.
//

#import "UIImageView+WDYWebImage.h"

#import <SDWebImage/UIImageView+WebCache.h>
//transition 为mMAC所用，对于iOS目前不用
@implementation UIImageView (WDYWebImage)

- (void)wdy_setImageWithURL:(nullable NSURL *)url{
    [self wdy_setImageWithURL:url PlaceholderImage:nil Progress:nil CompleteBlock:nil];
}

- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage{
    [self wdy_setImageWithURL:url PlaceholderImage:placeholderImage Progress:nil CompleteBlock:nil];
}

- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage
                   Progress:(nullable WDYWebImageDownloaderProgressBlock)progress{
    [self wdy_setImageWithURL:url PlaceholderImage:placeholderImage Progress:progress CompleteBlock:nil];
}

/**
 设置图片
 
 @param url 图片地址
 @param placeholderImage 占位图
 @param progress 进度
 @param complete 完成回调
 
 */
- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage
                   Progress:(nullable WDYWebImageDownloaderProgressBlock)progress
              CompleteBlock:(nullable WDYExternalCompletionBlock)complete{
    
}

- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)placeholderImage success:(DownImageSuccessBlock)success failed:(DownImageFailedBlock)failed progress:(DownImageProgressBlock)progress {
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:placeholderImage] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        progress(receivedSize * 1.0 / expectedSize);
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (error) {
            failed(error);
        } else {
            self.image = image;
            success(image);
        }
        
    }];
}

@end
