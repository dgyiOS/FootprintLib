//
//  NSBundle+ImageAssets.m
//  
//
//  Created by 邓光洋 on 2019/3/18.
//

#import "NSBundle+ImageAssets.h"

@implementation NSBundle (ImageAssets)

/*
 NSBundle *bundle = [NSBundle bundleForClass:[self class]];
 NSString *bundlePath = [bundle.resourcePath stringByAppendingPathComponent:@"/FootprintLib.bundle"];
 NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
 UIImage *image = [UIImage imageNamed:@"fp_avatar" inBundle:resource_bundle compatibleWithTraitCollection:nil];
 */

+ (NSBundle *)image_bundleWithClass:(Class)class {
    NSString *bundlePath = [[NSBundle bundleForClass:class].resourcePath stringByAppendingPathComponent:@"/FootprintLib.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    return resource_bundle;
}

+ (UIImage *)generateImageWithClass:(Class)class imageName:(NSString *)imageName {
    NSBundle *bundle = [NSBundle image_bundleWithClass:class];
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}

@end
