//
//  Level_27.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_27.h"

@interface Level_27 ()

@end

@implementation Level_27

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 27;
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
    
    AMEEnemyButton * battleship = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(130*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship];
    
    [self.dialogArray addObject: @"已经玩到27关了"];
    [self.dialogArray addObject: @"提督是否觉得这个游戏还有可以改进的地方呢?;ex"];
    [self.dialogArray addObject: @"如果有好的想法,请一定要告诉作者哦!"];
    
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
