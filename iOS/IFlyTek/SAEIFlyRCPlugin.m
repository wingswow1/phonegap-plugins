//
//  SAEIFlyRCPlugin.m
//  iFlytekTest
//
//  Created by Ley Liu on 12-5-7.
//  Copyright (c) 2012年 SINA SAE. All rights reserved.
//

#import "SAEIFlyRCPlugin.h"

#define IFlyServerURL @"http://dev.voicecloud.cn/index.htm"

@implementation SAEIFlyRCPlugin

@synthesize callBackId;
@synthesize resultCallback;

-(void)init:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    self.callBackId=[arguments objectAtIndex:0];
    NSString *appId=[arguments objectAtIndex:1];
    
    NSString *initParam=[[NSString alloc] initWithFormat:@"server_url=%@,appid=%@",IFlyServerURL,appId];
    iFlyRC=[[IFlyRecognizeControl alloc] initWithOrigin:CGPointMake(20, 70) theInitParam:initParam];
    iFlyRC.delegate=self;
    [self.viewController.view addSubview:iFlyRC];
}

-(void)setOption:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    if(!iFlyRC)
        return;
    self.callBackId=[arguments objectAtIndex:0];
    NSDictionary *params=[NSDictionary dictionaryWithDictionary:options];
    NSString *engine=[params objectForKey:@"engine"];
    NSString *engineParam=[params objectForKey:@"engineParams"];
    NSString *sampleRate=[params objectForKey:@"sampleRate"];
    NSString *grammar=[params objectForKey:@"grammar"];
    
    [iFlyRC setEngine:engine theEngineParam:engineParam theGrammarID:grammar];
    
    if([sampleRate isEqualToString:@"rate8k"])
        [iFlyRC setSampleRate:8000];
    
    
}

-(void)setListener:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    if(!iFlyRC)
        return;
    
    NSString *callBKName=[arguments objectAtIndex:1];
    self.resultCallback=callBKName;
}

-(void)start:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    if(!iFlyRC)
        return;
    
    self.callBackId=[arguments objectAtIndex:1];
    isLast=NO;
    [iFlyRC start];
}

-(void)cancel:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    if(!iFlyRC)
        return;
    
    [iFlyRC cancel];
}

-(void)uploadKeyword:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    if(!iFlyRC)
        return;
    
    NSLog(@"arguments count=%d",[arguments count]);
    NSLog(@"options count=%d",[options count]);
//    keys, contentId, onDataUploaded, onEnd
    
}

#pragma mark - Delegate
- (void)onResult:(IFlyRecognizeControl *)iFlyRecognizeControl theResult:(NSArray *)resultArray
{
    NSMutableDictionary *result=[[NSMutableDictionary alloc] initWithCapacity:2];
    [result setObject:[NSNumber numberWithBool:isLast] forKey:@"isLast"];
    [result setObject:resultArray forKey:@"results"];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];
    [super writeJavascript:[pluginResult toSuccessCallbackString:self.resultCallback]];
}

- (void)onRecognizeEnd:(IFlyRecognizeControl *)iFlyRecognizeControl theError:(SpeechError) error
{
    isLast=YES;
    
    if(error==0)
    {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [super writeJavascript:[pluginResult toSuccessCallbackString:self.callBackId]];
    }
    else {
        NSMutableDictionary *result=[[NSMutableDictionary alloc] initWithCapacity:2];
        
        [result setObject:[NSNumber numberWithInt:error] forKey:@"errorCode"];
        [result setObject:[iFlyRecognizeControl getErrorDescription:error] forKey:@"message"];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:result];
        [super writeJavascript:[pluginResult toErrorCallbackString:self.callBackId]];
    }
}
@end
