//
//  Level_29.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_29.h"

@interface Level_29 ()

@end

@implementation Level_29

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 29;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(100*X_P, 120*Y_P, 80*X_P, 35*Y_P)];
    cruiser1.info.nowLife = 3000;
    [cruiser1 updateInfoLabelText];
    [self.enemyArray addObject:cruiser1];
    
    AMEEnemyButton * cruiser2 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(200*X_P, 120*Y_P, 80*X_P, 35*Y_P)];
    cruiser2.info.nowLife = 3000;
    [cruiser2 updateInfoLabelText];
    [self.enemyArray addObject:cruiser2];

    AMEEnemyButton * aircraftCarrier1 = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    aircraftCarrier1.info.nowLife = 5000;
    [aircraftCarrier1 updateInfoLabelText];
    [self.enemyArray addObject:aircraftCarrier1];
    
    AMEEnemyButton * aircraftCarrier2 = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(150*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    aircraftCarrier2.info.nowLife = 5000;
    [aircraftCarrier2 updateInfoLabelText];
    [self.enemyArray addObject:aircraftCarrier2];
    
    [self.dialogArray addObject: @"发现敌军的残血舰队"];
    [self.dialogArray addObject: @"请提督速战速决,否则敌机来袭时将会束手无策;ex"];
    [self.dialogArray addObject: @"拜托了,提督!"];
    
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"做得漂亮!提督!"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
