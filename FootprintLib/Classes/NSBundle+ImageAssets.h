//
//  NSBundle+ImageAssets.h
//  
//
//  Created by 邓光洋 on 2019/3/18.
//

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (ImageAssets)

///生成bundle
+ (NSBundle *)image_bundleWithClass:(Class)class;
///拿到对应bundle下面的图片
+ (UIImage *)generateImageWithClass:(Class)class imageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
