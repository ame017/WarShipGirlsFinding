//
//  warShipGirls.m
//  warShipGirlsFindingSetTest
//
//  Created by Apple on 16/5/15.
//  Copyright © 2016年 AME studio Co., LTD. All rights reserved.
//

#import "AMEWarShipGirls.h"

@implementation AMEWarShipGirls

+ (NSMutableArray *)getAllWarShipGirs{
    NSMutableArray * allWarShipGirs = [NSMutableArray arrayWithCapacity:0];
    NSString * path = [[NSBundle mainBundle]pathForResource:@"mainWarShipData" ofType:@"txt"];
    NSString * allWarShipGirsstr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray * arr1 = [allWarShipGirsstr componentsSeparatedByString:@"+"];
    for (NSString * notHavePlus in arr1) {
        NSArray * arr2 = [notHavePlus componentsSeparatedByString:@"-"];
        AMEWarShipGirls * wsg = [AMEWarShipGirls kvcBreakSTDString:arr2[1]];
        [allWarShipGirs addObject:wsg];
    }
    return allWarShipGirs;
}

+ (instancetype)kvcBreakSTDString:(NSString *)str{
    AMEWarShipGirls * wsg = [AMEWarShipGirls new];
    NSArray * arr1 = [str componentsSeparatedByString:@","];
    for (NSString * s in arr1) {
        NSArray * arr2 = [s componentsSeparatedByString:@":"];
        if ([arr2[0] isEqualToString:@"warShipName"]) {
            [wsg setValue:[arr2[1] uppercaseString] forKey:arr2[0]];
        }else{
            [wsg setValue:@([arr2[1] integerValue]) forKey:arr2[0]];
        }
    }
    return wsg;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"warShipID:%lu,warShipName:%@,shipType:%lu,nationality:%lu,aircraft:%d,torpedo:%d,secGun:%d,mainGunType:%lu,hairColor:%lu",self.warShipID,self.warShipName,self.shipType,self.nationality,self.aircraft,self.torpedo,self.secGun,self.mainGunType,self.hairColor];
}
@end
