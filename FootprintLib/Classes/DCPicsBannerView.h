//
//  DCPicsBannerView.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCFootprintProtocol.h"

NS_ASSUME_NONNULL_BEGIN

//pic cell
@interface DCPicCell : UICollectionViewCell

@property (nonatomic, readonly) UIImageView *imgV;
@property (nonatomic, readonly) UIImageView *poseImgV;
@property (nonatomic, copy) void(^ClickPosePicBlock)(void); //点击pose

@end

//manual scroll pics view
@interface DCPicsBannerView : UIView

@property (nonatomic, readonly) UILabel *numberLab;
@property (nonatomic, readonly) UICollectionView *collectionView;
@property (nonatomic, readonly) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
