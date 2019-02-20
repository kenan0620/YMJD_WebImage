//
//  UIImageView+WDYWebImage.m
//  YMJD_WebImage
//
//  Created by mac on 2019/2/18.
//  Copyright © 2019 伟东云教育. All rights reserved.
//

#import "UIImageView+WDYWebImage.h"
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

@end
