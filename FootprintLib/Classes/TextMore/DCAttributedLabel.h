//
//  DCAttributedLabel.h
//  梦想旅行
//
//  Created by 邓光洋 on 2018/11/20.
//  Copyright © 2018 北京梦想智联科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DCAttributedTextStatus) {
    kDCAttributedTextStatusNormal = 0,
    kDCAttributedTextStatusOpen,
    kDCAttributedTextStatusClose,
};

@class DCAttributedLabel;

@protocol DCAttributedLabelDelegate <NSObject>

@required
- (void)displayView:(DCAttributedLabel *)label openHeight:(CGFloat)height;
- (void)displayView:(DCAttributedLabel *)label closeHeight:(CGFloat)height;

@end


@interface DCAttributedLabel : UIView

@property (nonatomic, weak) id<DCAttributedLabelDelegate> delegate;

@property (nonatomic, strong)    UIFont *font;                   //字体
@property (nonatomic, strong)    UIColor *textColor;             //文字颜色
@property (nonatomic, assign)    CTTextAlignment textAlignment;  //文字排版样式
@property (nonatomic, assign)    CTLineBreakMode lineBreakMode;  //LineBreakMode
@property (nonatomic, assign)    CGFloat lineSpacing;            //行间距
@property (nonatomic, assign)    CGFloat paragraphSpacing;       //段间距
@property (nonatomic, assign)    NSInteger   numberOfLines;      //行数
@property (nonatomic, assign)    DCAttributedTextStatus state;   //文字状态

//大小
- (CGSize)sizeThatFits:(CGSize)size;

//普通文本
- (void)setText:(NSString *)text;

//属性文本
- (void)setAttributedText:(NSAttributedString *)attributedText;

// 添加展开关闭按钮
- (void)setOpenString:(NSString *)openString
          closeString:(NSString *)closeString;

// 添加展开关闭按钮 字体、字色
- (void)setOpenString:(NSString *)openString
          closeString:(NSString *)closeString
                 font:(UIFont *)font
            textColor:(UIColor *)textColor;


@end

