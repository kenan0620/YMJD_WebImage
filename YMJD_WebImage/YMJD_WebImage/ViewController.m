//
//  ViewController.m
//  YMJD_WebImage
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 伟东云教育. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYWebImage/YYWebImage.h>

@interface ViewController ()
@property (nonatomic, readwrite, strong) UIImageView *sdWebImageView;
@property (nonatomic, readwrite, strong) UIImageView *yyWebImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.sdWebImageView];
    [self.view addSubview:self.yyWebImageView];
    
    
    
    [self sdWebImage];
    [self yyWebImage];
}

- (void)sdWebImage{
    [self.sdWebImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img5.duitang.com/uploads/item/201411/07/20141107164412_v284V.jpeg"]];
}

- (void)yyWebImage{
    /**
     YYWebImage 是一个异步图片加载框架 (YYKit 组件之一).
     
     其设计目的是试图替代 SDWebImage、PINRemoteImage、FLAnimatedImage 等开源框架，它支持这些开源框架的大部分功能，同时增加了大量新特性、并且有不小的性能提升。
     
     它底层用 YYCache 实现了内存和磁盘缓存, 用 YYImage 实现了 WebP/APNG/GIF 动图的解码和播放。
     
     特性
     异步的图片加载，支持 HTTP 和本地文件。
     支持 GIF、APNG、WebP 动画（动态缓存，低内存占用）。
     支持逐行扫描、隔行扫描、渐进式图像加载。
     UIImageView、UIButton、MKAnnotationView、CALayer 的 Category 方法支持。
     常见图片处理：模糊、圆角、大小调整、裁切、旋转、色调等。
     高性能的内存和磁盘缓存。
     高性能的图片设置方式，以避免主线程阻塞。
     每个类和方法都有完善的文档注释。
     
     
     */
    
    //用法
    /**
     1、加载网络图片
     */
    //    self.yyWebImageView.yy_imageURL = [NSURL URLWithString:@"http://img.bimg.126.net/photo/ZZ5EGyuUCp9hBPk6_s4Ehg==/5727171351132208489.jpg"];
    /**
     2、加载本地图片
     */
    //    self.yyWebImageView.yy_imageURL = [NSURL fileURLWithPath:@"/Users/mac/Documents/GitHub/YMJD_WebImage/YMJD_WebImage/YMJD_WebImage/Resource/1.jpg"];
    
    /**
     3、渐进式图片加载
     */
//    [self.yyWebImageView yy_setImageWithURL:[NSURL URLWithString:@"http://www.missyuan.com/siyuan/day_090110/20090110_ee22a57dfaa439b6bdb9UvthlUQGwK70.jpg"] options:(YYWebImageOptionProgressive)];
    
    // 渐进式加载，增加模糊效果和渐变动画 （见本页最上方的GIF演示）
//    [self.yyWebImageView yy_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548244741267&di=2c6305be7e775a599da0e34d5cbed4e7&imgtype=0&src=http%3A%2F%2Fpic35.photophoto.cn%2F20150608%2F1155117475683207_b.jpg"] options:YYWebImageOptionProgressive | YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
    
    //4、加载动图 ---- 只需要把 `UIImageView` 替换为 `YYAnimatedImageView` 即可。
//    self.yyWebImageView.yy_imageURL = [NSURL URLWithString:@"http://img.zcool.cn/community/01e90b595ef4d8a8012193a36c8ee6.gif"];
    
    //加载、处理图片
    // 1. 下载图片
    // 2. 获得图片下载进度
    // 3. 调整图片大小、加圆角
    // 4. 显示图片时增加一个淡入动画，以获得更好的用户体验
    
    [self.yyWebImageView yy_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548244741267&di=6da4740f3ebe6026abc461e5673b383f&imgtype=0&src=http%3A%2F%2Fpic36.photophoto.cn%2F20150804%2F1155117433920323_b.jpg"]
                      placeholder:nil
                          options:YYWebImageOptionSetImageWithFadeAnimation
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             NSLog(@"%f",(float)receivedSize / expectedSize);
                         }
                        transform:^UIImage *(UIImage *image, NSURL *url) {
                            image = [image yy_imageByResizeToSize:CGSizeMake(100, 100) contentMode:UIViewContentModeCenter];
                            return [image yy_imageByRoundCornerRadius:10];
                        }
                       completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                           if (from == YYWebImageFromDiskCache) {
                               NSLog(@"load from disk cache");
                           }
                       }];
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    // 获取缓存大小 、图片数量
    NSLog(@"%lu",(unsigned long)cache.memoryCache.totalCost);
    NSLog(@"%lu",(unsigned long)cache.memoryCache.totalCount);
    NSLog(@"%lu",(unsigned long)cache.diskCache.totalCost);
    NSLog(@"%lu",(unsigned long)cache.diskCache.totalCount);
    
    // 清空缓存
    [cache.memoryCache removeAllObjects];
    [cache.diskCache removeAllObjects];
    
    //删除指定的资源
    [cache.diskCache removeObjectForKey:@""];
    
    // 清空磁盘缓存，带进度回调
    [cache.diskCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
        // progress
    } endBlock:^(BOOL error) {
        // end
    }];
}
- (UIImageView *)sdWebImageView{
    if (!_sdWebImageView) {
        _sdWebImageView = [[UIImageView alloc]init];
        _sdWebImageView.frame = CGRectMake(10, 50,300, 200);
        _sdWebImageView.backgroundColor = [UIColor yellowColor];
    }
    return _sdWebImageView;
}

- (UIImageView *)yyWebImageView{
    if (!_yyWebImageView) {
        _yyWebImageView = [[UIImageView alloc]init];
        _yyWebImageView.frame = CGRectMake(10, 300,300, 500);
        _yyWebImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _yyWebImageView;
}
@end
