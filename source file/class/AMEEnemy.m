//
//  AMEEnemy.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/10.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEEnemy.h"

#define DD_BASIC_LIFE 1000
#define CA_BASIC_LIFE 2000
#define BB_BASIC_LIFE 3500
#define CV_BASIC_LIFE 3200

#define DD_BASIC_DAMAGE 0.5
#define CA_BASIC_DAMAGE 1.2
#define BB_BASIC_DAMAGE 3.0
#define CV_BASIC_DAMAGE 0

#define PLAYER_ARMOURED_FACTOR 0.05
#define LIFE_LEVEL_FACTOR 0.08

@implementation AMEEnemy


+(instancetype)destroyer:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_destroyer;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*DD_BASIC_LIFE;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*DD_BASIC_LIFE;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*DD_BASIC_DAMAGE;
    emy.FireInterval = 6;
    emy.startTime = arc4random()%6;
    return emy;
}
+(instancetype)cruiser:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_cruiser;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CA_BASIC_LIFE;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CA_BASIC_LIFE;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*CA_BASIC_DAMAGE;
    emy.FireInterval = 12;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)battleship:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_battleship;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*BB_BASIC_DAMAGE;
    emy.FireInterval = 20;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)aircraftCarrier:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_aircraftCarrier;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE;
    emy.damage = CV_BASIC_DAMAGE;
    emy.FireInterval = 99999999999;
    emy.startTime = arc4random()%15;//空母类正负15秒
    return emy;
}

+(instancetype)quzhuqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_quzhuqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*DD_BASIC_LIFE*2.5;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*DD_BASIC_LIFE*2.5;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*DD_BASIC_DAMAGE*1.5;
    emy.FireInterval = 5;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)qingxunqigui:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_qingxunqigui;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CA_BASIC_LIFE*2;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CA_BASIC_LIFE*2;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*CA_BASIC_DAMAGE*1.5;
    emy.FireInterval = 10;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)zhanjianqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_zhanjianqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE*1.5;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE*1.5;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*BB_BASIC_DAMAGE*1.5;
    emy.FireInterval = 18;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)kongmuqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_kongmuqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.5;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.5;
    emy.damage = CV_BASIC_DAMAGE;
    emy.FireInterval = 9999999999;
    emy.startTime = arc4random()%12;
    return emy;
}

+(instancetype)gangwanqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_gangwanqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE*4;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*BB_BASIC_LIFE*4;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*DD_BASIC_DAMAGE;
    emy.FireInterval = 10;
    emy.startTime = arc4random()%6;
    return emy;
}

+(instancetype)zhongjianqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_zhongjianqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.4;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.4;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*CA_BASIC_DAMAGE;
    emy.FireInterval = 10;
    emy.startTime = arc4random()%6;
    return emy;
}
+(instancetype)beifangqiji:(NSUInteger)level{
    AMEEnemy * emy = [[AMEEnemy alloc]init];
    emy.shipType = en_beifangqiji;
    emy.allLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.3;
    emy.nowLife = (level*LIFE_LEVEL_FACTOR+1)*CV_BASIC_LIFE*1.3;
    emy.damage = (level*0.1-[AMEPlayer defualtPlayer].lv_armoured*PLAYER_ARMOURED_FACTOR+1)*CA_BASIC_DAMAGE;
    emy.FireInterval = 10;
    emy.startTime = arc4random()%6;
    return emy;
}

-(void)setNowLife:(NSInteger)nowLife{
    _nowLife = nowLife;
    if (_nowLife<0) {
        _nowLife = 0;
    }
    if (_nowLife>_allLife) {
        _nowLife = _allLife;
    }
}

- (void)setDamage:(float)damage{
    _damage = damage;
    if (_damage<=0) {
        _damage = 0.01;
    }
}

@end
