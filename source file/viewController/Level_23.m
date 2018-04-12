//
//  Level_23.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_23.h"

@interface Level_23 ()

@end

@implementation Level_23

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 23;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(200*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    
    
    AMEEnemyButton * aircraftCarrier = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier];
    
    [self.dialogArray addObject: @"报告提督,发现敌军航空母舰!!"];
    [self.dialogArray addObject: @"关于航空母舰,提督是否清楚呢?;ex"];
    [self.dialogArray addObject: @"航母不会进行炮击,但是会在一定时间间隔产生敌机;"];
    [self.dialogArray addObject: @"敌军的轰炸会产生一定的伤害,并有概率使我方起火"];
    [self.dialogArray addObject: @"提升防空等级可以减少被轰炸的伤害,请提督加以重视;ex"];
    [self.dialogArray addObject: @"那么,加油哦,提督!"];
    
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
