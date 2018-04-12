//
//  Level_26.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_26.h"

@interface Level_26 ()

@end

@implementation Level_26

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 26;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(30*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(110*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(190*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * destroyer4 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(270*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer4];
    
    [self.dialogArray addObject: @"恭喜提督,击退了空母栖姬"];
    [self.dialogArray addObject: @"看来短时间敌人的攻势会减缓了;ex"];
    
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
