//
//  DCFootprintCell.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DCUserInfoView, DCPicsBannerView, DCCommonView;

@interface DCFootprintCell : UITableViewCell

@property (nonatomic, readonly) DCUserInfoView *userInfoView;
@property (nonatomic, readonly) UIImageView *videoImgV;
@property (nonatomic, readonly) UIImageView *playImgV;
@property (nonatomic, readonly) DCPicsBannerView *picsView;
@property (nonatomic, readonly) DCCommonView *commonView;

@end

NS_ASSUME_NONNULL_END
