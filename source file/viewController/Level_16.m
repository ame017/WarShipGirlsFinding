//
//  Level_16.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_16.h"

@interface Level_16 ()

@end

@implementation Level_16

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 16;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(250*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(140*X_P, 60*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser];
    
    //开始的对话
    [self.dialogArray addObject: @"恭喜提督!!打倒了敌军复数的头目!!"];
    [self.dialogArray addObject: @"如果感觉战斗越来越棘手了,可以选择低难度的关卡哦;ex"];
    [self.dialogArray addObject: @"不过呢,如果重复挑战关卡,收到的奖励会减半;"];
    [self.dialogArray addObject: @"同时,如果关卡等级过低的话,产生的奖励更会大幅度减少"];
    [self.dialogArray addObject: @"所以提督如果想练习的话,请选择与当前进度相近的关卡;ex"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"做得漂亮!提督!"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
