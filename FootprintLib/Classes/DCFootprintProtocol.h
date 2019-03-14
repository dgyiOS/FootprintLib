//
//  DCFootprintProtocol.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/14.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DCUserInfoView, DCPicCell, DCPicsBannerView, DCFootprintCell, DCCommentCell;

@protocol DCFootprintProtocol <NSObject>

@optional

#pragma mark -- fill data
//第一行用户信息view数据
- (void)configDataInUserInfoView:(DCUserInfoView *)userInfoView;

//手动滚动轮播view数据
- (NSArray *)picsDataArray; //图片模型model数组
- (void)configDataInPicsBannerView:(DCPicsBannerView *)picsBannerView;
//单个轮播cell数据
- (void)configDataInPicCell:(DCPicCell *)cell;

//评论view数据
- (NSArray *)commentDataArray;
- (void)configDataInCommentCell:(DCCommentCell *)commentCell;

//整个cell数据
- (void)configDataInFootprintCell:(DCFootprintCell *)cell;

#pragma mark -- FootprintCell 15 events
//skip personal center page
- (void)clickIconToSkipPersonal;

//change follow status
- (void)changeFollowStatus:(UIButton *)btn;

//play or pause video
- (void)clickVideoViewToPlayOrPauseVideo;

//skip pose detail page
- (void)clickPoseImageAction;

//look big pic in browser
- (void)clickImageViewToBrowserBigPic:(NSInteger)picIndex;

//skip topic detail page
- (void)skipTopicDetailPage;

//skip search poi page
- (void)skipSearchPoiPage;

//open or close the content
- (void)openOrCloseTheFootprintContent:(CGFloat)height state:(NSInteger)state;

//laud one's footprint
- (void)laudOneFootprint;

//share one's footprint
- (void)shareFootprint;

//delete mine one footprint
- (void)deleteMineFootprint;

//report other's one footprint
- (void)reportOtherOneFootprint;

//skip comment list page (2次)
- (void)skipCommentListPage;

//modal keyboard and begin input word to prepare comment
- (void)beginToShowKeyboardToBeginComment;

@end

NS_ASSUME_NONNULL_END
