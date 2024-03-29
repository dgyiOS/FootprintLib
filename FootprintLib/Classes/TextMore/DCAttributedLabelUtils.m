//
//  DCAttributedLabelUtils.m
//  梦想旅行
//
//  Created by 邓光洋 on 2018/11/20.
//  Copyright © 2018 北京梦想智联科技有限公司. All rights reserved.
//

#import "DCAttributedLabelUtils.h"
#import "NSMutableAttributedString+CTFrameRef.h"

static const CGFloat kMargin = 5;

@implementation DCAttributedLabelUtils

// 将点击的位置转换成字符串的偏移量，如果没有找到，则返回-1
+ (CFIndex)touchContentOffsetInView:(UIView *)view atPoint:(CGPoint)point ctFrame:(CTFrameRef)ctFrame {
    // 获取CFArrayRef
    CTFrameRef textFrame = ctFrame;
    CFArrayRef lines = CTFrameGetLines(textFrame);
    
    if (!lines) return -1;
    
    CFIndex count = CFArrayGetCount(lines);
    
    CGPoint origins[count];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    // 翻转坐标系
    CGAffineTransform transform =  CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    transform = CGAffineTransformScale(transform, 1.f, -1.f);
    
    CFIndex idx = -1;
    for (CFIndex index = 0; index < count; index ++) {
        CGPoint linePoint = origins[index];
        
        CTLineRef line = CFArrayGetValueAtIndex(lines, index);
        
        CGRect flippedRect = CTLineGetTypographicBoundsAsRect(line, linePoint);
        CGRect rect = CGRectApplyAffineTransform(flippedRect, transform);
        rect = CGRectInset(rect, 0, -kMargin);
        
        if (CGRectContainsPoint(rect, point)) {
            // 将点击的坐标转换成相对于当前行的坐标
            CGPoint relativePoint = CGPointMake(point.x - CGRectGetMinX(rect),
                                                point.y - CGRectGetMinY(rect));
            // 获取点击位置所处的字符位置，就是相当于点击了第几个字符
            idx = CTLineGetStringIndexForPosition(line, relativePoint);
        }
    }
    return idx;
}

@end

