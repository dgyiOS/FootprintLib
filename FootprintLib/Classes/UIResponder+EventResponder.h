//
//  UIResponder+EventResponder.h
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/13.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (EventResponder)

- (void)routeEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
