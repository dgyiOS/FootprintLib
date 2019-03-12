//
//  DCCommentView.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "DCCommentView.h"
#import <Masonry/Masonry.h>

@interface DCCommentCell ()

@property (nonatomic, strong) UILabel *commentLab;

@end

@implementation DCCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildSubviews];
        [self buildSubviewsConstraints];
    }
    return self;
}

- (void)buildSubviews {
    _commentLab = [[UILabel alloc]init];
    _commentLab.font = [UIFont systemFontOfSize:13.f];
    _commentLab.numberOfLines = 2;
    _commentLab.textColor = [UIColor blackColor];
}

- (void)buildSubviewsConstraints {
    [self.contentView addSubview:_commentLab];
    [_commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

@end


@interface DCCommentView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *countLab;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DCCommentView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self buildSubviews];
        [self buildSubviewsConstraints];
    }
    return self;
}

- (void)buildSubviews {
    _countLab = [[UILabel alloc]init];
    _countLab.font = [UIFont systemFontOfSize:13.f];
    _countLab.textColor = [UIColor yellowColor];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.scrollEnabled = NO;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    [_tableView registerClass:[DCCommentCell class] forCellReuseIdentifier:@"DCCommentCell"];
}

- (void)buildSubviewsConstraints {
    [self addSubview:self.countLab];
    [self addSubview:self.tableView];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.countLab.mas_bottom).offset(10);
        make.left.right.bottom.mas_equalTo(self);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCCommentCell"];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


@end
