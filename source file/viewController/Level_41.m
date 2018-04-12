//
//  Level_41.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_41.h"

@interface Level_41 ()

@end

@implementation Level_41

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 41;
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(30*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(110*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(190*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * destroyer4 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 80*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer4];
    
    AMEEnemyButton * quzhiqiji = [AMEEnemyButton quzhuqijiButton:self.level frame:CGRectMake(140*X_P, 50*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:quzhiqiji];
    
    AMEEnemyButton * gangwanqiji = [AMEEnemyButton gangwanqijiButton:self.level frame:CGRectMake(250*X_P, 70*Y_P, 120*X_P, 100*Y_P)];
    [self.enemyArray addObject:gangwanqiji];
    
    [self.dialogArray addObject: @"41~50关,将会是挑战模式"];
    [self.dialogArray addObject: @"每关的难度都很高"];
    [self.dialogArray addObject: @"所以如果觉得自己玩的不够好的话,请先去前面的关卡练习再来挑战~;ex"];
    [self.dialogArray addObject: @"提督!准备好了吗?在拂晓的水平线上刻下胜利吧!!"];
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
