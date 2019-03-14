//
//  DCCommonView.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCCommonView.h"
#import "DCAttributedLabel.h"
#import "DCCommentView.h"
#import <Masonry/Masonry.h>
#import "UIResponder+EventResponder.h"
#import "DCHeader.h"

@interface DCCommonView ()

@property (nonatomic, strong) UILabel                                *tagLab;
@property (nonatomic, strong) UIButton                               *tagTopicBtn;
@property (nonatomic, strong) UIImageView                            *locImgV;
@property (nonatomic, strong) UILabel                                *locInfoLab;
@property (nonatomic, strong) UIButton                               *locationSearchBtn;
@property (nonatomic, strong) DCAttributedLabel                      *contentLab;
@property (nonatomic, strong) UIButton                               *praiseBtn;
@property (nonatomic, strong) UILabel                                *praiseCountLab;
@property (nonatomic, strong) UIButton                               *commentBtn;
@property (nonatomic, strong) UILabel                                *commentCountLab;
@property (nonatomic, strong) UIButton                               *shareBtn;
@property (nonatomic, strong) UIButton                               *reportBtn;
@property (nonatomic, strong) UIButton                               *deleteBtn;
@property (nonatomic, strong) DCCommentView                          *commentView;
@property (nonatomic, strong) UIImageView                            *myIconImgV;
@property (nonatomic, strong) UIButton                               *placedTextBtn;
@property (nonatomic, strong) UILabel                                *dateLab;

@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation DCCommonView

#pragma mark -- init
- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
        [self registerCommonViewEvent];
        [self fillFalseData];
    }
    return self;
}

#pragma mark -- UI
- (void)buildSubviews {
    _tagLab = [[UILabel alloc]init];
    _tagLab.font = [UIFont systemFontOfSize:14.f];
    _tagLab.textColor = [UIColor blueColor];
    
    _tagTopicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _locImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fp_localImage"]];
    _locImgV.layer.masksToBounds = YES;
    
    _locInfoLab = [[UILabel alloc]init];
    _locInfoLab.font = [UIFont systemFontOfSize:14.f];
    _locInfoLab.textColor = [UIColor blackColor];
    
    _locationSearchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _contentLab = [[DCAttributedLabel alloc]init];
    _contentLab.font = [UIFont systemFontOfSize:14.f];
    _contentLab.textColor = [UIColor redColor];
    _contentLab.backgroundColor = [UIColor whiteColor];
    [_contentLab setText:@"一行两行文字，使用试下效果。一行两行文字，使用试下效果。一行两行文字，使用试下效果。一行两行文字，使用试下效果。"];
    self.contentHeight = [_contentLab sizeThatFits:CGSizeMake(CGRectGetWidth(self.bounds), MAXFLOAT)].height;
//    [_contentLab setOpenString:@"展开" closeString:@"收起" font:[UIFont boldSystemFontOfSize:14.f] textColor:[UIColor redColor]];
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_praiseBtn setImage:[UIImage imageNamed:@"fp_laudNone"] forState:UIControlStateNormal];
    [_praiseBtn setImage:[UIImage imageNamed:@"fp_laudAdd"] forState:UIControlStateSelected];
    
    _praiseCountLab = [[UILabel alloc]init];
    _praiseCountLab.textColor = [UIColor blackColor];
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentBtn setImage:[UIImage imageNamed:@"fp_commentImage"] forState:UIControlStateNormal];
    
    _commentCountLab = [[UILabel alloc]init];
    _commentCountLab.textColor = [UIColor blackColor];
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shareBtn setImage:[UIImage imageNamed:@"fp_shareImage"] forState:UIControlStateNormal];
    
    _reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reportBtn setImage:[UIImage imageNamed:@"fp_reportImage"] forState:UIControlStateNormal];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setImage:[UIImage imageNamed:@"fp_deleteImage"] forState:UIControlStateNormal];
    
    _commentView = [[DCCommentView alloc]init];
    
    _myIconImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fp_avatar"]];
    _myIconImgV.layer.cornerRadius = 9;
    _myIconImgV.layer.masksToBounds = YES;
    _myIconImgV.contentMode = UIViewContentModeScaleAspectFill;

    _placedTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_placedTextBtn setTitle:@"添加评论..." forState:UIControlStateNormal];
    _placedTextBtn.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [_placedTextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _dateLab = [[UILabel alloc]init];
    _dateLab.font = [UIFont systemFontOfSize:12.f];
    _dateLab.textColor = [UIColor blackColor];
    _dateLab.textAlignment = 0;
}

#pragma mark -- Constraints
- (void)buildSubviewsConstraints {
    [self addSubview:self.tagLab];
    [self addSubview:self.tagTopicBtn];
    [self addSubview:self.locImgV];
    [self addSubview:self.locInfoLab];
    [self addSubview:self.locationSearchBtn];
    [self addSubview:self.contentLab];
    [self addSubview:self.praiseBtn];
    [self addSubview:self.praiseCountLab];
    [self addSubview:self.commentBtn];
    [self addSubview:self.commentCountLab];
    [self addSubview:self.shareBtn];
    [self addSubview:self.reportBtn];
    [self addSubview:self.deleteBtn];
    [self addSubview:self.commentView];
    [self addSubview:self.myIconImgV];
    [self addSubview:self.placedTextBtn];
    [self addSubview:self.dateLab];
    
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
    
    [self.tagTopicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.tagLab);
        make.left.right.mas_equalTo(self);
    }];
    
    [self.locImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.tagLab.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    [self.locInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.locImgV.mas_right).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.locImgV.mas_centerY);
    }];
    
    [self.locationSearchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.locImgV);
        make.left.right.mas_equalTo(self);
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.locImgV.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(self.contentHeight);
    }];
    
    //社交部分
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentLab.mas_left);
        make.top.mas_equalTo(self.contentLab.mas_bottom).offset(10);
    }];
    [self.praiseCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.praiseBtn.mas_right).offset(4);
        make.top.mas_equalTo(self.praiseBtn.mas_top).offset(2);
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.praiseCountLab.mas_right).offset(15);
        make.centerY.mas_equalTo(self.praiseBtn.mas_centerY);
    }];
    [self.commentCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.commentBtn.mas_right).offset(4);
        make.top.mas_equalTo(self.commentBtn.mas_top).offset(2);
    }];
    
    //评论view
    [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.praiseBtn.mas_bottom).offset(10);
        make.left.mas_equalTo(self.praiseBtn.mas_left);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
    
    [self.myIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.commentView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.placedTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.myIconImgV.mas_right).offset(4);
        make.centerY.mas_equalTo(self.myIconImgV.mas_centerY);
    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.myIconImgV.mas_bottom).offset(8);
        make.left.mas_equalTo(self.myIconImgV.mas_left);
    }];
    
    [self updateOtherCommonViewConstraints];
}

#pragma mark -- update mine UI Constraints
- (void)updateMineCommonViewConstraints {
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.commentBtn.mas_centerY);
        make.left.mas_equalTo(self.commentCountLab.mas_right).offset(15);
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.shareBtn.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
}

#pragma mark -- update other UI Constraints
- (void)updateOtherCommonViewConstraints {
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.commentBtn.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
    
    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.shareBtn.mas_centerY);
        make.right.mas_equalTo(self.shareBtn.mas_left).offset(-15);
    }];
}

#pragma mark -- event
- (void)registerCommonViewEvent {
    //跳转话题详情
    [self.tagTopicBtn addTarget:self action:@selector(skipTopicDetail) forControlEvents:UIControlEventTouchUpInside];
    //跳转搜索poi页
    [self.locationSearchBtn addTarget:self action:@selector(skipSearchPoi) forControlEvents:UIControlEventTouchUpInside];
    
    //点赞
    [self.praiseBtn addTarget:self action:@selector(laudAction) forControlEvents:UIControlEventTouchUpInside];
    
    //分享
    [self.shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    
    //举报
    [self.reportBtn addTarget:self action:@selector(reportAction) forControlEvents:UIControlEventTouchUpInside];
    
    //删除
    [self.deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    
    //跳转评论列表
    [self.commentBtn addTarget:self action:@selector(skipCommentListAction) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapCommentView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skipCommentListAction)];
    [self.commentView addGestureRecognizer: tapCommentView];
    
    //弹起键盘准备评论
    [self.placedTextBtn addTarget:self action:@selector(beginToComment) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 事件
- (void)skipTopicDetail {
    [self routeEventWithName:DCCommonViewSkipTopicDetailVC userInfo:@{}];
}

- (void)skipSearchPoi {
    [self routeEventWithName:DCCommonViewSkipSearchVC userInfo:@{}];
}

- (void)laudAction {
    [self routeEventWithName:DCCommonViewLaudAction userInfo:@{}];
}

- (void)shareAction {
    [self routeEventWithName:DCCommonViewShareAction userInfo:@{}];
}

- (void)reportAction {
    [self routeEventWithName:DCCommonViewReportAction userInfo:@{}];
}

- (void)deleteAction {
    [self routeEventWithName:DCCommonViewDeleteAction userInfo:@{}];
}

- (void)skipCommentListAction {
    [self routeEventWithName:DCCommonViewSkipCommenListVC userInfo:@{}];
}

- (void)beginToComment {
    [self routeEventWithName:DCCommonViewBeginShowKeyboardView userInfo:@{}];
}


#pragma mark -- 填充假数据
- (void)fillFalseData {
    self.tagLab.text = @"#测试用一下#";
    self.locInfoLab.text = @"北京Poi点";
//    [self.contentLab setText:@"一行两行文字，使用试下效果。一行两行文字，使用试下效果。一行两行文字，使用试下效果。一行两行文字，使用试下效果。"];
    
    self.praiseCountLab.text = @"111";
    self.commentCountLab.text = @"222";
    self.dateLab.text = @"2个月前";
}

@end
