//
//  Level_4.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/13.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_4.h"

@interface Level_4 ()

@end

@implementation Level_4

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 4;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    [self.dialogArray addObject: @"关于奖励界面,也给提督讲解一下吧"];
    [self.dialogArray addObject: @"战后奖励是与技术统计挂钩的;ex"];
    [self.dialogArray addObject: @"如果提督每波的攻击水平较高,那么,获得的奖励也会提高"];
    [self.dialogArray addObject: @"简单来说要在最少的攻击次数产生最大的伤害"];
    [self.dialogArray addObject: @"所以,每进行一次攻击,都请提督三思而后行!;ex"];
    [self.dialogArray addObject: @"那么,继续战斗吧!"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"啊咧....收到敌军大部队来袭的警报!"];
    [self.endArray addObject:@"下一关请提督务必小心哦!"];
    
    
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
