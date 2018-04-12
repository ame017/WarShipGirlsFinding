//
//  warShipGirls.h
//  warShipGirlsFindingSetTest
//
//  Created by Apple on 16/5/15.
//  Copyright © 2016年 AME studio Co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, shipTypeEnum) {
    STother         = 0,
    battleship      = 1,
    cruiser         = 2,
    destroyer       = 3,
    aircraftCarrier = 4,
    submarine       = 5
};
typedef NS_ENUM(NSUInteger, nationalityEnum) {
    NAother         = 0,
    Japan           = 1,
    USA             = 2,
    Germany         = 3,
    Russian         = 4,
    UK              = 5
};
typedef NS_ENUM(NSUInteger, hairColorEnum) {
    HCother         = 0,
    black           = 1,
    red             = 2,
    orange          = 3,
    green           = 4,
    blue            = 5,
    purple          = 6,
    pink            = 7,//6月12日:由于6和7颜色相近且数量有点少 所以把7和6进行了合并
    white           = 8
};

@interface AMEWarShipGirls : NSObject
@property (nonatomic) NSUInteger warShipID;
@property (nonatomic,retain) NSString * warShipName;
@property (nonatomic) shipTypeEnum shipType;
@property (nonatomic) nationalityEnum nationality;
@property (nonatomic) BOOL aircraft;
@property (nonatomic) BOOL torpedo;
@property (nonatomic) BOOL secGun;
@property (nonatomic) NSUInteger mainGunType;
@property (nonatomic) hairColorEnum hairColor;

+ (NSMutableArray *)getAllWarShipGirs;

@end
