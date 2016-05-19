//
//  AppDelegate+LiteEvent.m
//  AOPTransactionIntactDemo
//
//  Created by wuyike on 16/5/19.
//  Copyright © 2016年 bongmi. All rights reserved.
//

#import "AppLiteDelegate+LiteEvent.h"

#import "Aspects.h"

typedef void (^AspectHandlerBlock)(id<AspectInfo> aspectInfo);

@implementation AppLiteDelegate (LiteEvent)

- (void)setLiteEvent {
#ifdef LITE_VERSION
    
    NSDictionary *configs = @{
                             @"AOPTopViewController": @{
                                     UserTrackedEvents: @[
                                             @{
                                                 UserEventName: @"detailBtn",
                                                 UserEventSelectorName: @"detailTopBtnEvent:",
                                                 UserEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"Top detailBtn clicked, this is lite version");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             @"AOPBottomViewController": @{
                                     UserTrackedEvents: @[
                                             @{
                                                 UserEventName: @"detailBtn",
                                                 UserEventSelectorName: @"detailBottomBtnEvent:",
                                                 UserEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"Bottom detailBtn clicked this is lite version");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             @"AOPLeftViewController": @{
                                     UserTrackedEvents: @[
                                             @{
                                                 UserEventName: @"detailBtn",
                                                 UserEventSelectorName: @"detailLeftBtnEvent:",
                                                 UserEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"Left detailBtn clicked this is lite version");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             @"AOPRightViewController": @{
                                     UserTrackedEvents: @[
                                             @{
                                                 UserEventName: @"detailBtn",
                                                 UserEventSelectorName: @"detailRightBtnEvent:",
                                                 UserEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"Right detailBtn clicked this is lite version");
                                                 },
                                                 },
                                             ],
                                     },
                             };
    
    for (NSString *className in configs) {
        Class clazz = NSClassFromString(className);
        NSDictionary *config = configs[className];
        
        if (config[UserTrackedEvents]) {
            for (NSDictionary *event in config[UserTrackedEvents]) {
                SEL selekor = NSSelectorFromString(event[UserEventSelectorName]);
                AspectHandlerBlock block = event[UserEventHandlerBlock];
                
                [clazz aspect_hookSelector:selekor
                               withOptions:AspectPositionInstead
                                usingBlock:^(id<AspectInfo> aspectInfo) {
                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                        block(aspectInfo);
                                    });
                                  } error:NULL];
                
            }
        }
    }
#endif
}
@end
