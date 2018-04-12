//
//  AMESave.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/4.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMESave.h"

@implementation AMESave

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isData = NO;
        self.lv_fire = 1;
        self.lv_torpedo = 1;
        self.lv_armoured = 1;
        self.lv_antiaircraft = 1;
        self.bgmOpen = YES;
        self.seOpen = YES;
        self.indexWSG = SHIMAKAZE;
    }
    return self;
}

- (void)saveWithIndex:(NSUInteger)index{
    NSString * kvcStr = [self description];
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    switch (index) {
        case 1:{
            [def setObject:kvcStr forKey:@"save1"];
        }break;
        case 2:{
            [def setObject:kvcStr forKey:@"save2"];
        }break;
        case 3:{
            [def setObject:kvcStr forKey:@"save3"];
        }break;
    }
}
- (void)loadWithIndex:(NSUInteger)index{
    NSString * kvcStr;
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    switch (index) {
        case 1:{
            kvcStr = [def objectForKey:@"save1"];
            _playerID = 1;
        }break;
        case 2:{
            kvcStr = [def objectForKey:@"save2"];
            _playerID = 2;
        }break;
        case 3:{
            kvcStr = [def objectForKey:@"save3"];
            _playerID = 3;
        }break;
    }
    if (kvcStr) {
        [self kvcBreakSTDString:kvcStr];
        self.isData = YES;
    }else{
        self.isData = NO;
    }
}

- (void)kvcBreakSTDString:(NSString *)str{
    NSArray * arr1 = [str componentsSeparatedByString:@","];
    for (NSString * s in arr1) {
        NSArray * arr2 = [s componentsSeparatedByString:@":"];
        if ([arr2[0] isEqualToString:@"playerName"]) {
            [self setValue:arr2[1] forKey:arr2[0]];
        }else{
            [self setValue:@([arr2[1] integerValue]) forKey:arr2[0]];
        }
    }
}


- (void)setS_fuelNum:(NSUInteger)s_fuelNum{
    _s_fuelNum = s_fuelNum;
    if (_s_fuelNum>999) {
        _s_fuelNum = 999;
    }
}

-(void)setS_steelNum:(NSUInteger)s_steelNum{
    _s_steelNum = s_steelNum;
    if (_s_steelNum>999) {
        _s_steelNum = 999;
    }
}

- (void)setS_aluminiumNum:(NSUInteger)s_aluminiumNum{
    _s_aluminiumNum = s_aluminiumNum;
    if (_s_aluminiumNum>999) {
        _s_aluminiumNum = 999;
    }
}

- (void)setS_ammunitionNum:(NSUInteger)s_ammunitionNum{
    _s_ammunitionNum = s_ammunitionNum;
    if (_s_ammunitionNum>999) {
        _s_ammunitionNum = 999;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"playerName:%@,s_fuelNum:%lu,s_steelNum:%lu,s_ammunitionNum:%lu,s_aluminiumNum:%lu,coinNum:%lu,lv_fire:%lu,lv_torpedo:%lu,lv_armoured:%lu,lv_antiaircraft:%lu,p_aircraftNum:%lu,p_detectorNum:%lu,p_torpedoNum:%lu,p_repairNum:%lu,nowLevel:%lu,bgmOpen:%d,seOpen:%d,indexWSG:%lu", self.playerName,self.s_fuelNum,self.s_steelNum,self.s_ammunitionNum,self.s_aluminiumNum,self.coinNum,self.lv_fire,self.lv_torpedo,self.lv_armoured,self.lv_antiaircraft,self.p_aircraftNum,self.p_detectorNum,self.p_torpedoNum,self.p_repairNum,self.nowLevel,self.bgmOpen,self.seOpen,self.indexWSG];
}

@end
