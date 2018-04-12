//
//  Level_18.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_18.h"

@interface Level_18 ()

@end

@implementation Level_18

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 18;
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
    
    AMEEnemyButton * destroyer5 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 60*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer5];
    
    [self.dialogArray addObject: @"关于道具使用效果的衰减,提督也许不知道~"];
    [self.dialogArray addObject: @"飞航队每次使用后,对同一目标再次使用时,伤害将会降低40%!!;ex"];
    [self.dialogArray addObject: @"雷击组每次使用后,再次使用时,伤害将会降低20%!!"];
    [self.dialogArray addObject: @"请妥善使用道具,以免浪费资源~;ex"];
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
