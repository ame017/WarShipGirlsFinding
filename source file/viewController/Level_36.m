//
//  Level_36.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_36.h"

@interface Level_36 ()

@end

@implementation Level_36

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 36;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * aircraftCarrier1 = [AMEEnemyButton  aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject: aircraftCarrier1];
    
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(30*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(110*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(190*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * destroyer4 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(270*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer4];
    
    [self.dialogArray addObject: @"呼....终于击退了中间栖姬"];
    [self.dialogArray addObject: @"这样子是第36关了呢;ex"];
    [self.dialogArray addObject: @"提督是否需要休息呢?"];
    [self.dialogArray addObject: @"如果感到累的话,一定要去休息一下再继续游戏哦;"];
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
