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
        [self buildSubviews];
        [self buildSubviewsConstraints];
    }
    return self;
}


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

- (void)buildSubviewsConstraints {
    [self.contentView addSubview:self.userInfoView];
    [self.contentView addSubview:self.videoImgV];
    [self.videoImgV addSubview:self.playImgV];
    [self.contentView addSubview:self.picsView];
    [self.contentView addSubview:self.commonView];
    
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(52);
        make.left.right.top.mas_equalTo(self.contentView);
    }];
    
    [self.videoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
    }];
    
    [self.playImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.videoImgV);
    }];
    
    [self.picsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.left.right.top.mas_equalTo(self.contentView);
    }];
    
    [self.commonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.picsView.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.contentView);
    }];
    
}

- (void)registerCellSubviewsEvent {
    //跳转个人中心
    UITapGestureRecognizer *tapIcon = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipPersonalCenter)];
    [self.userInfoView.iconImgV addGestureRecognizer:tapIcon];
    
    //关注按钮状态改变
    [self.userInfoView.followBtn addTarget:self action:@selector(changeToOtherFollowStatus:) forControlEvents:UIControlEventTouchUpInside];
    //图片点击放大浏览
//    self.picsView
    
    //图片上pose图片点击
    
    
    //视频暂停或播放
    UITapGestureRecognizer *tapVideo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipPersonalCenter)];
    [self.videoImgV addGestureRecognizer:tapVideo];
    
    //跳转话题详情
    [self.commonView.tagTopicBtn addTarget:self action:@selector(skipTopicDetail) forControlEvents:UIControlEventTouchUpInside];
    //跳转搜索poi页
    [self.commonView.locationSearchBtn addTarget:self action:@selector(skipSearchPoi) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //点赞
    [self.commonView.praiseBtn addTarget:self action:@selector(laudAction) forControlEvents:UIControlEventTouchUpInside];
    
    //分享
    [self.commonView.shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];

    //举报
    [self.commonView.reportBtn addTarget:self action:@selector(reportAction) forControlEvents:UIControlEventTouchUpInside];
    
    //删除
    [self.commonView.deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    
    //跳转评论列表
    [self.commonView.commentBtn addTarget:self action:@selector(skipCommentListAction) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapCommentView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipCommentListAction)];
    [self.commonView.commentView addGestureRecognizer: tapCommentView];
    
    //弹起键盘准备评论
    [self.commonView.placedTextBtn addTarget:self action:@selector(beginToComment) forControlEvents:UIControlEventTouchUpInside];
}


- (void)skipPersonalCenter {
    if ([self.delegate respondsToSelector:@selector(clickIconToSkipPersonal)]) {
        [self.delegate clickIconToSkipPersonal];
    }
}

- (void)changeToOtherFollowStatus:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(changeFollowStatus:)]) {
        [self.delegate changeFollowStatus:sender];
    }
}

- (void)skipTopicDetail {
    if ([self.delegate respondsToSelector:@selector(skipTopicDetailPage)]) {
        [self.delegate skipTopicDetailPage];
    }
}

- (void)skipSearchPoi {
    if ([self.delegate respondsToSelector:@selector(skipSearchPoiPage)]) {
        [self.delegate skipSearchPoiPage];
    }
}

- (void)laudAction {
    if ([self.delegate respondsToSelector:@selector(laudOneFootprint)]) {
        [self.delegate laudOneFootprint];
    }
}

- (void)beginToComment {
    if ([self.delegate respondsToSelector:@selector(beginToShowKeyboardToBeginComment)]) {
        [self.delegate beginToShowKeyboardToBeginComment];
    }
}

- (void)shareAction {
    if ([self.delegate respondsToSelector:@selector(shareFootprint)]) {
        [self.delegate shareFootprint];
    }
}

- (void)reportAction {
    if ([self.delegate respondsToSelector:@selector(reportOtherOneFootprint)]) {
        [self.delegate reportOtherOneFootprint];
    }
}

- (void)deleteAction {
    if ([self.delegate respondsToSelector:@selector(deleteMineFootprint)]) {
        [self.delegate deleteMineFootprint];
    }
}

- (void)skipCommentListAction {
    if ([self.delegate respondsToSelector:@selector(skipCommentListPage)]) {
        [self.delegate skipCommentListPage];
    }
}

@end
