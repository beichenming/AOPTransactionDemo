//
//  AppDelegate+LiteEvent.h
//  AOPTransactionIntactDemo
//
//  Created by wuyike on 16/5/19.
//  Copyright © 2016年 bongmi. All rights reserved.
//

#import "AppLiteDelegate.h"

#define UserTrackedEvents @"UserTrackedEvents"
#define UserEventName @"UserEventName"
#define UserEventSelectorName @"UserEventSelectorName"
#define UserEventHandlerBlock @"UserEventHandlerBlock"

@interface AppLiteDelegate (LiteEvent)

- (void)setLiteEvent;

@end
