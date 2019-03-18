//
//  DCUserInfoView.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCUserInfoView.h"
#import <Masonry/Masonry.h>
#import "UIResponder+EventResponder.h"
#import "DCHeader.h"
#import "NSBundle+ImageAssets.h"

@interface DCUserInfoView ()

@property (nonatomic, strong) UIView      *topColorView;
@property (nonatomic, strong) UIImageView *iconImgV;
@property (nonatomic, strong) UILabel     *nickLab;
@property (nonatomic, strong) UILabel     *reviewLab;//我的
@property (nonatomic, strong) UIButton    *followBtn;//他人的

@end

@implementation DCUserInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
        [self fillFalseData];
    }
    return self;
}

- (void)buildSubviews {
    self.topColorView = ({
        UIView *view = [[UIView alloc]init];
        view;
    });
    
    self.iconImgV = ({
        UIImageView *imgv = [[UIImageView alloc]init];
        imgv.image = [NSBundle generateImageWithClass:[self class] imageName:@"avatar"];
        imgv.layer.masksToBounds = YES;
        imgv.userInteractionEnabled = YES;
        imgv.contentMode = UIViewContentModeScaleAspectFill;
        imgv;
    });
    
    self.nickLab = ({
        UILabel *lab = [[UILabel alloc]init];
        lab.font = [UIFont boldSystemFontOfSize:15.f];
        lab;
    });
    
    self.reviewLab = ({
        UILabel *lab = [[UILabel alloc]init];
        lab.font = [UIFont boldSystemFontOfSize:15.f];
        lab.textAlignment = NSTextAlignmentRight;
        [lab setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        lab.hidden = YES;
        lab;
    });
    
    self.followBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[NSBundle generateImageWithClass:[self class] imageName:@"fp_addFollow"] forState:UIControlStateNormal];
        [btn setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        btn.hidden = YES;
        btn;
    });
}

- (void)buildSubviewsConstraints {
    [self addSubview:self.topColorView];
    [self addSubview:self.iconImgV];
    [self addSubview:self.nickLab];
    [self addSubview:self.reviewLab];
    [self addSubview:self.followBtn];
    
    [self.topColorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(8);
    }];
    
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.topColorView.mas_bottom).offset(7);
    }];
    
    [self.nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImgV.mas_right).offset(10);
        make.centerY.mas_equalTo(self.iconImgV.mas_centerY);
    }];
    
    [self.reviewLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nickLab.mas_centerY);
        make.left.mas_equalTo(self.nickLab.mas_right).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nickLab.mas_centerY);
        make.left.mas_equalTo(self.nickLab.mas_right).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(66, 28));
    }];
    
    [self isMineInfo:NO];
}

- (void)isMineInfo:(BOOL)isMine {
    if (isMine) {
        self.reviewLab.hidden = NO;
        self.followBtn.hidden = YES;
    } else {
        self.reviewLab.hidden = YES;
        self.followBtn.hidden = NO;
    }
}

//MARK: -- setter value
- (void)setTopColorView_bgColor:(UIColor *)topColorView_bgColor {
    self.topColorView.backgroundColor = topColorView_bgColor;
}

- (void)setIconImgV_radius:(CGFloat)iconImgV_radius {
    self.iconImgV.layer.cornerRadius = iconImgV_radius;
}

- (void)setNickLab_textColor:(UIColor *)nickLab_textColor {
    self.nickLab.textColor = nickLab_textColor;
}

- (void)setReviewLab_textColor:(UIColor *)reviewLab_textColor {
    self.reviewLab.textColor = reviewLab_textColor;
}

- (void)setFollowBtn_img:(UIImage *)followBtn_img {
    [self.followBtn setBackgroundImage:followBtn_img forState:UIControlStateNormal];
}

- (void)registerUserInfoViewEvent {
    UITapGestureRecognizer *tapIcon = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipPersonalCenter)];
    [self.iconImgV addGestureRecognizer:tapIcon];
    
    [self.followBtn addTarget:self action:@selector(changeToOtherFollowStatus:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 事件
- (void)skipPersonalCenter {
    [self.iconImgV routeEventWithName:DCUserInfoViewSkipPersonalCenter userInfo:@{}];
}

- (void)changeToOtherFollowStatus:(UIButton *)sender {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:sender forKey:DCUserInfoViewChangeFollowStatus];
    [self.followBtn routeEventWithName:DCUserInfoViewChangeFollowStatus userInfo:dic];
}

#pragma mark -- fill False data
- (void)fillFalseData {
    self.nickLab.text = @"昵称";
}

@end
