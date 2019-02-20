//
//  UIImageView+WDYWebImage.h
//  YMJD_WebImage
//
//  Created by mac on 2019/2/18.
//  Copyright © 2019 伟东云教育. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^WDYExternalCompletionBlock)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL);
typedef void(^WDYWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL);

@interface UIImageView (WDYWebImage)

- (void)wdy_setImageWithURL:(nullable NSURL *)url;

- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage;

- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage
                   Progress:(nullable WDYWebImageDownloaderProgressBlock)progress;

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
              CompleteBlock:(nullable WDYExternalCompletionBlock)complete;

@end

NS_ASSUME_NONNULL_END
