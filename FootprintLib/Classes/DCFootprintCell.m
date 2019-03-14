//
//  DCFootprintCell.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCFootprintCell.h"
#import "DCUserInfoView.h"
#import "DCPicsBannerView.h"
#import "DCCommonView.h"
#import "DCCommentView.h"
#import <Masonry/Masonry.h>
#import "DCHeader.h"
#import "UIResponder+EventResponder.h"

@interface DCFootprintCell ()

@property (nonatomic, strong) DCUserInfoView *userInfoView;
@property (nonatomic, strong) UIImageView *videoImgV;
@property (nonatomic, strong) UIImageView *playImgV;
@property (nonatomic, strong) DCPicsBannerView *picsView;
@property (nonatomic, strong) DCCommonView *commonView;

@end

@implementation DCFootprintCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildSubviews];
        [self buildSubviewsConstraints];
        [self registerCellSubviewsEvent];
    }
    return self;
}

#pragma mark -- UI
- (void)buildSubviews {
    //用户头像、昵称、审核状态(我的)、关注状态(他人)
    self.userInfoView = [[DCUserInfoView alloc]init];
    
    //视频承载view，imageView放coverImage使用
    self.videoImgV = [[UIImageView alloc]init];
    self.playImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_footmark_details_video_icon"]];
    
    //手动滑动轮播图 单图无分页，多图有分页且分页在图片下面(呵呵)
    self.picsView = [[DCPicsBannerView alloc]init];
    
    //共同view
    self.commonView = [[DCCommonView alloc]init];
}

#pragma mark -- layout
- (void)buildSubviewsConstraints {
    [self.contentView addSubview:self.userInfoView];
//    [self.contentView addSubview:self.videoImgV];
//    [self.videoImgV addSubview:self.playImgV];
    [self.contentView addSubview:self.picsView];
    [self.contentView addSubview:self.commonView];
    
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(52);
        make.left.right.top.mas_equalTo(self.contentView);
    }];
    
//    [self.videoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(100);
//        make.left.right.mas_equalTo(self.contentView);
//        make.top.mas_equalTo(self.userInfoView.mas_bottom).offset(10);
//    }];
//
//    [self.playImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self.videoImgV);
//    }];
    
    [self.picsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(180);
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.userInfoView.mas_bottom).offset(10);
    }];
    
    [self.commonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.picsView.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.contentView);
    }];
}

#pragma mark -- event
- (void)registerCellSubviewsEvent {
    UITapGestureRecognizer *tapVideo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipPersonalCenter)];
    [self.videoImgV addGestureRecognizer:tapVideo];
}

- (void)skipPersonalCenter {
    [self routeEventWithName:DCVideoImageViewPalyOrPause userInfo:@{}];
}



@end
