//
//  DCPicsBannerView.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCPicCell : UICollectionViewCell

@property (nonatomic, readonly) UIImageView *imgV;
@property (nonatomic, readonly) UIImageView *poseImgV;

@end


@interface DCPicsBannerView : UIView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, readonly) UILabel *numberLab;
@property (nonatomic, readonly) UICollectionView *collectionView;
@property (nonatomic, readonly) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
