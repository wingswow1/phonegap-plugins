//
//  SAEIFlyRCPlugin.h
//  iFlytekTest
//
//  Created by Ley Liu on 12-5-7.
//  Copyright (c) 2012年 SINA SAE. All rights reserved.
//

#import <Cordova/CDVPlugin.h>
#import <IFlyISR/IFlyRecognizeControl.h>
@interface SAEIFlyRCPlugin : CDVPlugin<IFlyRecognizeControlDelegate>
{
    IFlyRecognizeControl *iFlyRC;
    BOOL isLast;
}
@property (nonatomic, copy) NSString *callBackId;
@property (nonatomic, copy) NSString *resultCallback;
-(void)init:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
-(void)setOption:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
@end
