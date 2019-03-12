//
//  DCPicsBannerView.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCPicsBannerView.h"
#import <Masonry/Masonry.h>

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
    }
    return self;
}

- (void)buildSubviews {
    _imgV = [[UIImageView alloc]init];
    _imgV.contentMode = UIViewContentModeScaleAspectFill;
    _imgV.layer.masksToBounds = YES;
    
    _poseImgV = [[UIImageView alloc]init];
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

@end


@interface DCPicsBannerView ()<UICollectionViewDelegate, UICollectionViewDataSource>

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
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(1000);
    }];
    
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.collectionView.mas_right).offset(-15);
        make.top.mas_equalTo(self.collectionView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(35, 25)).priorityHigh();
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.collectionView.mas_centerX);
        make.top.mas_equalTo(self.collectionView.mas_bottom).offset(10);
    }];
}

#pragma mark -- collectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DCPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DCPicCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
}



@end
