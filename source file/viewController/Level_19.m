//
//  Level_19.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_19.h"

@interface Level_19 ()

@end

@implementation Level_19

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 19;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(90*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * battleship = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship];
    
    [self.dialogArray addObject: @"提督!!紧急报告!!"];
    [self.dialogArray addObject: @"发现敌军战列舰..."];
    [self.dialogArray addObject: @"请做好迎击准备!!;ex"];
    [self.dialogArray addObject: @"关于战列舰,是敌军舰队产生攻击的主力部队之一,虽然不具备属性加成,但是血量以及攻击力都是十分恐怖的;"];
    [self.dialogArray addObject: @"请提督务必小心;ex"];
    [self.dialogArray addObject: @"镇守府全体舰娘听候您的调遣"];
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
