//
//  AMESave.h
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/4.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,IndexWarShipGirlEnum) {
    SHIMAKAZE       = 1,
    YAMATO          = 2,
    KONGOU          = 3
};

@interface AMESave : NSObject

@property (readonly,nonatomic) NSUInteger playerID;
@property (nonatomic,retain) NSString * playerName;
@property (nonatomic) BOOL isData;

@property (nonatomic) NSUInteger s_fuelNum;
@property (nonatomic) NSUInteger s_steelNum;
@property (nonatomic) NSUInteger s_ammunitionNum;
@property (nonatomic) NSUInteger s_aluminiumNum;

@property (nonatomic) NSUInteger coinNum;

@property (nonatomic) NSUInteger lv_fire;
@property (nonatomic) NSUInteger lv_torpedo;
@property (nonatomic) NSUInteger lv_armoured;
@property (nonatomic) NSUInteger lv_antiaircraft;

@property (nonatomic) NSUInteger p_aircraftNum;
@property (nonatomic) NSUInteger p_detectorNum;
@property (nonatomic) NSUInteger p_torpedoNum;
@property (nonatomic) NSUInteger p_repairNum;

@property (nonatomic) NSUInteger nowLevel;

@property (nonatomic) BOOL bgmOpen;
@property (nonatomic) BOOL seOpen;


@property (nonatomic) IndexWarShipGirlEnum indexWSG;

- (void)saveWithIndex:(NSUInteger)index;
- (void)loadWithIndex:(NSUInteger)index;

@end
