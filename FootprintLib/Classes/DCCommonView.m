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


@end

@implementation DCCommonView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
    }
    return self;
}

- (void)buildSubviews {
    _tagLab = [[UILabel alloc]init];
    _tagLab.font = [UIFont systemFontOfSize:14.f];
    _tagLab.textColor = [UIColor blueColor];
    
    _tagTopicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _locImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    
    _locInfoLab = [[UILabel alloc]init];
    _tagLab.font = [UIFont systemFontOfSize:14.f];
    _tagLab.textColor = [UIColor blackColor];
    
    _locationSearchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _contentLab = [[DCAttributedLabel alloc]init];
    _contentLab.font = [UIFont systemFontOfSize:14.f];
    _contentLab.textColor = [UIColor yellowColor];
    _contentLab.backgroundColor = [UIColor whiteColor];
    [_contentLab setOpenString:@"展开" closeString:@"收起" font:[UIFont boldSystemFontOfSize:14.f] textColor:[UIColor redColor]];
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_praiseBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_praiseBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shareBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    _reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reportBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    _commentView = [[DCCommentView alloc]init];
    
    _myIconImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
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

- (void)buildSubviewsConstraints {
    [self addSubview:self.tagLab];
    [self addSubview:self.tagTopicBtn];
    [self addSubview:self.locImgV];
    [self addSubview:self.locInfoLab];
    [self addSubview:self.locationSearchBtn];
    [self addSubview:self.contentLab];
    [self addSubview:self.praiseBtn];
    [self addSubview:self.commentBtn];
    [self addSubview:self.shareBtn];
    [self addSubview:self.reportBtn];
    [self addSubview:self.deleteBtn];
    [self addSubview:self.commentView];
    [self addSubview:self.myIconImgV];
    [self addSubview:self.placedTextBtn];
    [self addSubview:self.dateLab];
    
    
    
}


@end
