//
//  Level_2.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/12.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_2.h"

@interface Level_2 ()

@end

@implementation Level_2

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 2;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
 
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    [self.dialogArray addObject: @"之前的战斗感觉怎么样?提督!"];
    [self.dialogArray addObject: @"感觉应付不过来吗?"];
    [self.dialogArray addObject: @"如果感觉应付不过来 可以考虑购买一些道具哦!;ex"];
    [self.dialogArray addObject: @"那么我来介绍一下游戏中的道具吧"];
    [self.dialogArray addObject: @"首先是雷击组~;"];
    [self.dialogArray addObject: @"雷击组:对全体敌人进行一次鱼雷攻击,可以通过提升雷装lv来提升该道具的伤害"];
    [self.dialogArray addObject: @"其次是飞航队~"];
    [self.dialogArray addObject: @"飞航队:对单个敌人进行突击,伤害固定且不可通过技能等级来提升伤害,适合用于打击防御高的敌人."];
    [self.dialogArray addObject: @"再其次是探测器~"];
    [self.dialogArray addObject: @"探测器:持续时间为30秒,可以帮助提督自动筛选不合格舰娘"];
    [self.dialogArray addObject: @"探测器对于新手来说可是帮了大忙呢~(如果相同点为0的话,提督会遭受一定的伤害哦~);ex"];
    [self.dialogArray addObject: @"最后是损管组;"];
    [self.dialogArray addObject: @"如果受到异常状态(漏水或起火) 使用一次损管组道具即可清除一切异常状态~"];
    [self.dialogArray addObject: @"以上是关于道具的教程,如果有什么不明白的,再来打这一关的时候我会重新进行说明~;ex"];
    [self.dialogArray addObject: @"那么,要加油哦!提督~!"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"回镇守府尝试买一些道具吧~"];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //[self gameStart];
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
