//
//  AMEPlayer.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/2.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEPlayer.h"

@implementation AMEPlayer
static AMEPlayer * share = nil;

+ (instancetype)defualtPlayer{
    @synchronized(self) {
        if (share==nil) {
            share = [[AMEPlayer alloc]init];
        }
    }
    return share;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (share==nil) {
            share = [super allocWithZone:zone];
        }
    }
    return share;
}

//@property (readonly,nonatomic) NSUInteger playerID;
//@property (nonatomic,retain) NSString * playerID;
//
//@property (nonatomic) NSUInteger s_fuelNum;
//@property (nonatomic) NSUInteger s_steelNum;
//@property (nonatomic) NSUInteger s_ammunitionNum;
//@property (nonatomic) NSUInteger s_aluminiumNum;
//
//@property (nonatomic) NSUInteger coinNum;
//
//@property (nonatomic) NSUInteger lv_fire;
//@property (nonatomic) NSUInteger lv_torpedo;
//@property (nonatomic) NSUInteger lv_armoured;
//@property (nonatomic) NSUInteger lv_antiaircraft;
//
//@property (nonatomic) NSUInteger p_aircraftNum;
//@property (nonatomic) NSUInteger p_detectorNum;
//@property (nonatomic) NSUInteger p_torpedoNum;
//@property (nonatomic) NSUInteger p_repairNum;
//
//@property (nonatomic) NSUInteger nowLevel;
//
//@property (nonatomic) BOOL bgmOpen;
//@property (nonatomic) BOOL seOpen;

- (NSString *)description
{
    return [super description];
}
@end
