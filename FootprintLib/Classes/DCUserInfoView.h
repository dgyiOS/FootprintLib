//
//  DCUserInfoView.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCUserInfoView : UIView

@property (nonatomic, readonly) UIView      *topColorView;
@property (nonatomic, readonly) UIImageView *iconImgV;     //头像
@property (nonatomic, readonly) UILabel     *nickLab;      //昵称
@property (nonatomic, readonly) UILabel     *reviewLab;    //审核状态(我的)
@property (nonatomic, readonly) UIButton    *followBtn;    //关注(他人的)

@property (nonatomic, strong) UIColor *topColorView_bgColor;
@property (nonatomic, assign) CGFloat iconImgV_radius;
@property (nonatomic, strong) UIColor *nickLab_textColor;
@property (nonatomic, strong) UIColor *reviewLab_textColor;
@property (nonatomic, strong) UIImage *followBtn_img;

- (void)isMineInfo:(BOOL)isMine;


@end

NS_ASSUME_NONNULL_END
