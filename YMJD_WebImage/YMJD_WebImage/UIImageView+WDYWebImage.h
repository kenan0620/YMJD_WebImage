//
//  UIImageView+WDYWebImage.h
//  YMJD_WebImage
//
//  Created by mac on 2019/2/18.
//  Copyright © 2019 伟东云教育. All rights reserved.
//
//MAC开发中需要添加Transition，
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^WDYExternalCompletionBlock)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL);
typedef void(^WDYWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL);


///**
// *  监听下载成功的Block
// *
// *  @param image 返回下载成功的图片
// */
//typedef void(^DownImageSuccessBlock)(UIImage *image);
///**
// *  监听下载失败的Block
// *
// *  @param error 返回错误信息
// */
//typedef void(^DownImageFailedBlock)(NSError *error);
///**
// *  监听下载进度的Block
// *
// *  @param progress 返回下载进度
// */
//typedef void(^DownImageProgressBlock)(CGFloat progress);

@interface UIImageView (WDYWebImage)

/**
 设置图片
 
 @param url 图片地址

 */
- (void)wdy_setImageWithURL:(nullable NSURL *)url;

/**
 设置图片、占位图
 
 @param url 图片地址
 @param placeholderImage 占位图
 */
- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage;

/**
 设置图片、占位图、进度
 
 @param url 图片地址
 @param placeholderImage 占位图
 @param progress 进度
 */
- (void)wdy_setImageWithURL:(nullable NSURL *)url
           PlaceholderImage:(nullable UIImage *)placeholderImage
                   Progress:(nullable WDYWebImageDownloaderProgressBlock)progress;

/**
 设置图片、占位图、进度、回调
 
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
