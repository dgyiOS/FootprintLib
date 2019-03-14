//
//  DCCommonView.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DCAttributedLabel, DCCommentView;

@interface DCCommonView : UIView

@property (nonatomic, readonly) UILabel                                *tagLab;      //标签
@property (nonatomic, readonly) UIButton                               *tagTopicBtn; //标签点击btn
@property (nonatomic, readonly) UIImageView                            *locImgV;     //定位
@property (nonatomic, readonly) UILabel                                *locInfoLab;  //定位信息
@property (nonatomic, readonly) UIButton                               *locationSearchBtn;//定位点击btn
@property (nonatomic, readonly) DCAttributedLabel                      *contentLab;  //展开收起view
@property (nonatomic, readonly) UIButton                               *praiseBtn;       //点赞
@property (nonatomic, readonly) UILabel                                *praiseCountLab;  //点赞数
@property (nonatomic, readonly) UIButton                               *commentBtn;      //评论
@property (nonatomic, readonly) UILabel                                *commentCountLab; //评论数
@property (nonatomic, readonly) UIButton                               *shareBtn;        //分享
@property (nonatomic, readonly) UIButton                               *reportBtn;       //举报(他人)
@property (nonatomic, readonly) UIButton                               *deleteBtn;       //删除(我的)
@property (nonatomic, readonly) DCCommentView                          *commentView; //评论view
@property (nonatomic, readonly) UIImageView                            *myIconImgV;    //我的头像
@property (nonatomic, readonly) UIButton                               *placedTextBtn; //提示开始评论
@property (nonatomic, readonly) UILabel                                *dateLab;       //发布日期

- (void)updateMineCommonViewConstraints;
- (void)updateOtherCommonViewConstraints;

//填充假数据
- (void)fillFalseData;

@end

NS_ASSUME_NONNULL_END
