//
//  Level_33.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_33.h"

@interface Level_33 ()

@end

@implementation Level_33

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 33;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * battleship1 = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(30*X_P, 100*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship1];
    
    AMEEnemyButton * battleship2 = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(150*X_P, 100*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship2];
    
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(270*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser1];
    
    [self.dialogArray addObject: @"敌军的活动越来越频繁了"];
    [self.dialogArray addObject: @"提督有认真升级改造部件吗?;ex"];
    [self.dialogArray addObject: @"如果觉得力不从心,可以反复完成低等级的关卡来获得奖励哦"];
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
