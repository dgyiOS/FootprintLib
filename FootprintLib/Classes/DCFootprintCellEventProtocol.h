//
//  DCFootprintCellEventProtocol.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DCFootprintType) {
    kDCFootprintTypeMineFocused = 0,
    kDCFootprintTypeDetail,
    kDCFootprintTypePersonalCenter
};

@protocol DCFootprintCellEventProtocol <NSObject>

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
