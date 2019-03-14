//
//  UIResponder+EventResponder.m
//  RandomDemo
//
//  Created by 邓光洋 on 2019/3/13.
//  Copyright © 2019 邓光洋. All rights reserved.
//

#import "UIResponder+EventResponder.h"

@implementation UIResponder (EventResponder)

- (void)routeEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [[self nextResponder] routeEventWithName:eventName userInfo:userInfo];
}

@end
