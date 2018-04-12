//
//  AMEEnemy.h
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/10.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMEPlayer.h"

typedef NS_ENUM(NSUInteger, enemyShipTypeEnum) {
    en_battleship       = 1,
    en_cruiser          = 2,
    en_destroyer        = 3,
    en_aircraftCarrier  = 4,
    en_quzhuqiji        = 5,
    en_qingxunqigui     = 6,
    en_zhanjianqiji     = 7,
    en_kongmuqiji       = 8,
    en_gangwanqiji      = 9,
    en_zhongjianqiji    = 10,
    en_beifangqiji      = 11
};

@interface AMEEnemy : NSObject

@property (nonatomic) enemyShipTypeEnum shipType;
@property (nonatomic) NSInteger allLife;
@property (nonatomic) NSInteger nowLife;
@property (nonatomic) float damage;
@property (nonatomic) NSUInteger FireInterval;
@property (nonatomic) NSUInteger startTime;
@property (nonatomic) NSUInteger airBoomTimes;
@property (nonatomic) NSUInteger torpedoBoomTimes;

+(instancetype)destroyer:(NSUInteger)level;
+(instancetype)cruiser:(NSUInteger)level;
+(instancetype)battleship:(NSUInteger)level;
+(instancetype)aircraftCarrier:(NSUInteger)level;
+(instancetype)quzhuqiji:(NSUInteger)level;
+(instancetype)qingxunqigui:(NSUInteger)level;
+(instancetype)zhanjianqiji:(NSUInteger)level;
+(instancetype)kongmuqiji:(NSUInteger)level;
+(instancetype)gangwanqiji:(NSUInteger)level;
+(instancetype)zhongjianqiji:(NSUInteger)level;
+(instancetype)beifangqiji:(NSUInteger)level;



@end
