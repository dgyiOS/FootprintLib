//
//  DCAttributedLabelUtils.h
//  梦想旅行
//
//  Created by 邓光洋 on 2018/11/20.
//  Copyright © 2018 北京梦想智联科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface DCAttributedLabelUtils : NSObject

/**
 *  将点击的位置转换成字符串的偏移量，如果没有找到，则返回-1
 */
+ (CFIndex)touchContentOffsetInView:(UIView *)view atPoint:(CGPoint)point ctFrame:(CTFrameRef)ctFrame;

@end

