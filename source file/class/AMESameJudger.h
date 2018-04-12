//
//  AMESameJudger.h
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/7.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMEWarShipGirsButton.h"

@interface AMESameJudger : NSObject

@property (nonatomic) BOOL hairColorSame;
@property (nonatomic) BOOL secGunSame;
@property (nonatomic) BOOL torpedoSame;
@property (nonatomic) BOOL aircraftSame;
@property (nonatomic) BOOL nationalitySame;
@property (nonatomic) BOOL mainGunTypeSame;
@property (nonatomic) BOOL shipTypeSame;

@property (nonatomic) shipTypeEnum shipType;
@property (nonatomic) nationalityEnum nationality;
@property (nonatomic) BOOL aircraft;
@property (nonatomic) BOOL torpedo;
@property (nonatomic) BOOL secGun;


@property (nonatomic) NSUInteger mainGunType;
@property (nonatomic) hairColorEnum hairColor;




+ (instancetype)defualtJudger;
- (void)judgeWithButtonArray:(NSArray<AMEWarShipGirsButton *> *)array;

@end
