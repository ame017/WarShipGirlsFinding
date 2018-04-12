//
//  Level_1.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/12.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_1.h"

@interface Level_1 ()

@end

@implementation Level_1

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 1;
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:@"bgm_battle_0" RuntimeCount:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    [self.dialogArray addObject: @"提督!敌人打过来了呢~"];
    [self.dialogArray addObject: @"请您务必指挥我们战斗!;ex"];
    [self.dialogArray addObject: @"现在,镇守府的各位正在集结过来..;"];
    [self.dialogArray addObject: @"关于战斗的方法,我会在特定的关卡讲解给您~"];
    [self.dialogArray addObject: @"那么,现在从最基本的开始吧!!;ex"];
    [self.dialogArray addObject: @"每场战斗打响以后 镇守府的舰娘会集结到一起;"];
    [self.dialogArray addObject: @"提督要做的,就是把选出三个具有类似特点的舰娘进行一轮攻击"];
    [self.dialogArray addObject: @"被选中的三个舰娘相同的特点越多 攻击力就会越高"];
    [self.dialogArray addObject: @"所以,只要提督足够了解我们,就能组合出攻击力很高的组合哦~"];
    [self.dialogArray addObject: @"噫,提督又在想不好的事情了!!!!!!!"];
    [self.dialogArray addObject: @"真是讨厌呢!!!"];
    [self.dialogArray addObject: @"舰娘攻击判定,目前支持的相同点 您可要记好了! 一共有七种:舰艇类型,国籍,主炮口径大小,头发颜色,是否有鱼雷,是否有副炮,是否有舰载机"];
    [self.dialogArray addObject: @"旧舰娘出击之后,会返回休息室休息,新的舰娘会在原位置生成"];
    [self.dialogArray addObject: @"如果您是新手提督,可以从头发颜色开始入手哦~"];
    [self.dialogArray addObject: @"(啊!对了,偷偷告诉你哦:舰娘选择栏是可以左右移动的....)"];
    [self.dialogArray addObject: @"那么,来选出您的梦幻组合吧!;ex"];
    //结束的对话
    [self.endArray addObject:@"做的很棒哦!提督~"];
    [self.endArray addObject:@"回镇守府尝试升级部件吧~"];
    
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
