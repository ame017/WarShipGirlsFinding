//
//  AMESameJudger.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/7.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMESameJudger.h"

@implementation AMESameJudger
static AMESameJudger * share = nil;

+ (instancetype)defualtJudger{
    @synchronized(self) {
        if (share==nil) {
            share = [[AMESameJudger alloc]init];
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

- (void)judgeWithButtonArray:(NSArray<AMEWarShipGirsButton *> *)array{
    if (array[0].WarShipGirl.shipType == array[1].WarShipGirl.shipType && array[1].WarShipGirl.shipType == array[2].WarShipGirl.shipType) {
        self.shipTypeSame = YES;
        self.shipType = array[0].WarShipGirl.shipType;
    }else{
        self.shipTypeSame = NO;
    }
    if (array[0].WarShipGirl.nationality == array[1].WarShipGirl.nationality && array[1].WarShipGirl.nationality == array[2].WarShipGirl.nationality) {
        self.nationalitySame = YES;
        self.nationality = array[0].WarShipGirl.nationality;
    }else{
        self.nationalitySame = NO;
    }
    if (array[0].WarShipGirl.mainGunType == array[1].WarShipGirl.mainGunType && array[1].WarShipGirl.mainGunType == array[2].WarShipGirl.mainGunType) {
        self.mainGunTypeSame = YES;
        self.mainGunType = array[0].WarShipGirl.mainGunType;
    }else{
        self.mainGunTypeSame = NO;
    }
    if (array[0].WarShipGirl.torpedo == array[1].WarShipGirl.torpedo && array[1].WarShipGirl.torpedo == array[2].WarShipGirl.torpedo) {
        self.torpedoSame = YES;
        self.torpedo = array[0].WarShipGirl.torpedo;
    }else{
        self.torpedoSame = NO;
    }
    if (array[0].WarShipGirl.aircraft == array[1].WarShipGirl.aircraft && array[1].WarShipGirl.aircraft == array[2].WarShipGirl.aircraft) {
        self.aircraftSame = YES;
        self.aircraft = array[0].WarShipGirl.aircraft;
    }else{
        self.aircraftSame = NO;
    }
    if (array[0].WarShipGirl.secGun == array[1].WarShipGirl.secGun && array[1].WarShipGirl.secGun == array[2].WarShipGirl.secGun) {
        self.secGunSame = YES;
        self.secGun = array[0].WarShipGirl.secGun;
    }else{
        self.secGunSame = NO;
    }
    //排除其他发色
    if (array[0].WarShipGirl.hairColor == array[1].WarShipGirl.hairColor && array[1].WarShipGirl.hairColor == array[2].WarShipGirl.hairColor&&array[0].WarShipGirl.hairColor!=HCother) {
        self.hairColorSame = YES;
        self.hairColor = array[0].WarShipGirl.hairColor;
    }else{
        self.hairColorSame = NO;
    }
}

@end
