//
//  Level_37.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_37.h"

@interface Level_37 ()

@end

@implementation Level_37

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 37;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(30*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(110*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(190*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * destroyer4 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(270*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer4];
    
    AMEEnemyButton * destroyer5 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(130*X_P, 60*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer5];
    
    AMEEnemyButton * destroyer6 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(230*X_P, 60*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer6];
    
    [self.dialogArray addObject: @"提督有认真提升等级吗?"];
    [self.dialogArray addObject: @"关卡越来越难了,有没有好好准备呢;ex"];
    [self.dialogArray addObject: @"什么?提督已经买好零食准备潜逃了?"];
    [self.dialogArray addObject: @"呜呜.......讨厌!!;"];
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
