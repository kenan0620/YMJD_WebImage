//
//  UIImageView+WDYWebImage.m
//  YMJD_WebImage
//
//  Created by mac on 2019/2/18.
//  Copyright © 2019 伟东云教育. All rights reserved.
//

#import "UIImageView+WDYWebImage.h"

#import <SDWebImage/UIImageView+WebCache.h>
//transition 为MAC所用，对于iOS目前不用
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
    
    [self sd_setImageWithURL:url placeholderImage:placeholderImage options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        progress(receivedSize,expectedSize,targetURL);
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        complete(image,error,imageURL);
    }];
}


/**
 * 根据网络状态，加载对应图片
 * @param oringinalImageUrl 原始图片
 * @param thumbnailImageURL 略缩图
 * @param palceHolderImage  占位图片
 * @param completedBlock    完成回调
 */

//- (void)DKP_ImageWithOringinalImageURL:(NSString *)oringinalImageUrl thumbnailImageURL:(NSString *)thumbnailImageURL palceHolderImage:(UIImage *)placeholderImage completed:(WDYExternalCompletionBlock)completedBlock{
//    //查看沙盒中是否有原图，有原图显示原图，没有原图考虑下载
//    UIImage *bigImage =[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:oringinalImageUrl];
//    if (bigImage) {//有原图
//        [self sd_setImageWithURL:[NSURL URLWithString:oringinalImageUrl] placeholderImage:placeholderImage completed:completedBlock];
//    }else {//没有原图
//        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//        if (manager.reachableViaWiFi) {//wifi,直接加载原图
//            [self sd_setImageWithURL:[NSURL URLWithString:oringinalImageUrl] placeholderImage:placeholderImage completed:completedBlock];
//        }else if (manager.reachableViaWWAN) {//蜂窝网
//            BOOL alwaysLoadOriginalSource = YES;
//# warning 这里是模拟的，真实情况需要去偏好设置查看用户是怎么设置的
//            if (alwaysLoadOriginalSource) {//用户设置总是加载原图
//                [self sd_setImageWithURL:[NSURL URLWithString:oringinalImageUrl] placeholderImage:placeholderImage completed:completedBlock];
//            }else {//加载略缩图
//                [self sd_setImageWithURL:[NSURL URLWithString:thumbnailImageURL] placeholderImage:placeholderImage completed:completedBlock];
//            }
//        }else {//没网有略缩图显示略缩图，没有显示占位图
//
//            UIImage *smallImage =[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:thumbnailImageURL];
//            if (smallImage) {//有略缩图
//                [self sd_setImageWithURL:[NSURL URLWithString:thumbnailImageURL] placeholderImage:placeholderImage completed:completedBlock];
//            }else {//没有略缩图
//                [self sd_setImageWithURL:nil placeholderImage:placeholderImage completed:completedBlock];
//            }
//        }
//
//    }
//}

@end
