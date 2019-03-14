//
//  DCPicsBannerView.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCPicsBannerView.h"
#import <Masonry/Masonry.h>
#import "UIResponder+EventResponder.h"
#import "DCHeader.h"

@interface DCPicCell ()

@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UIImageView *poseImgV;

@end

@implementation DCPicCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
        [self registerPicCellEvent];
    }
    return self;
}

- (void)buildSubviews {
    _imgV = [[UIImageView alloc]init];
    _imgV.contentMode = UIViewContentModeScaleAspectFill;
    _imgV.image = [UIImage imageNamed:@"fp_bigImage"];
    _imgV.layer.masksToBounds = YES;
    
    _poseImgV = [[UIImageView alloc]init];
    _poseImgV.image = [UIImage imageNamed:@"fp_poseImage"];
    _poseImgV.contentMode = UIViewContentModeScaleAspectFill;
    _poseImgV.layer.masksToBounds = YES;
    _poseImgV.userInteractionEnabled = YES;
}

- (void)buildSubviewsConstraints {
    [self.contentView addSubview:_imgV];
    [self.contentView addSubview:_poseImgV];
    
    [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
    [_poseImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
    }];
}

- (void)registerPicCellEvent {
    UITapGestureRecognizer *poseTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickPose)];
    [self.poseImgV addGestureRecognizer:poseTap];
}

- (void)clickPose {
    if (self.ClickPosePicBlock) {
        self.ClickPosePicBlock();
    }
}

@end

@interface DCPicsBannerView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *numberLab;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation DCPicsBannerView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
    }
    return self;
}

- (void)buildSubviews {
    _numberLab = [[UILabel alloc]init];
    _numberLab.text = @"1/3";
    _numberLab.alpha = 0.5;
    _numberLab.layer.cornerRadius = 10;
    _numberLab.layer.masksToBounds = YES;
    _numberLab.font = [UIFont systemFontOfSize:12];
    _numberLab.textColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.layer.masksToBounds = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[DCPicCell class] forCellWithReuseIdentifier:@"DCPicCell"];
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.hidesForSinglePage = YES;
}

- (void)buildSubviewsConstraints {
    [self addSubview:self.collectionView];
    [self addSubview:self.numberLab];
    [self addSubview:self.pageControl];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.collectionView.mas_right).offset(-15);
        make.top.mas_equalTo(self.collectionView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(35, 25)).priorityHigh();
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.collectionView.mas_centerX);
        make.top.mas_equalTo(self.collectionView.mas_bottom).offset(-10);
    }];
}

#pragma mark -- collectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DCPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DCPicCell"
                                                                forIndexPath:indexPath];
#pragma mark -- 赋值
    
#pragma mark -- 点击pose图片事件
    cell.ClickPosePicBlock = ^{
        [self clickPoseInSomeCellAtIndexPath:indexPath];
    };
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.bounds.size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    DCPicCell *cell = (DCPicCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [self clickPicWithIndexPath:indexPath cell:cell];
}

///记录滚动到第几张图片，复用问题
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(self.window.frame);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@(index) forKey:DCPicsBannerViewScrollPic];
    [self routeEventWithName:DCPicsBannerViewScrollPic userInfo:dic];
}

//点击了某个图片cell上的pose图
- (void)clickPoseInSomeCellAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:indexPath forKey:DCPicsBannerViewClickPose];
    [self routeEventWithName:DCPicsBannerViewClickPose userInfo:dic];
}

///点击手动轮播图上的某张图片，全屏放大处理
- (void)clickPicWithIndexPath:(NSIndexPath *)indexPath cell:(DCPicCell *)cell {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:indexPath forKey:@"indexPath"];
    [dic setValue:cell forKey:@"cell"];
    [self routeEventWithName:DCPicsBannerViewClickPic userInfo:dic];
}

@end
