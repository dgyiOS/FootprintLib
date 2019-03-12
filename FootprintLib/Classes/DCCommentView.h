//
//  DCCommentView.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/7.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCCommentCell : UITableViewCell

@property (nonatomic, readonly) UILabel *commentLab;

@end


@interface DCCommentView : UIView

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, readonly) UILabel *countLab;
@property (nonatomic, readonly) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
