//
//  Level_6.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_6.h"

@interface Level_6 ()

@end

@implementation Level_6

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 6;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(250*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    [self.dialogArray addObject: @"好厉害哦!提督!!"];
    [self.dialogArray addObject: @"居然打倒敌军的头目;ex"];
    [self.dialogArray addObject: @"镇守府的各位要对您刮目相看了!!"];
    [self.dialogArray addObject: @"哦对了,提督也许注意到了;"];
    [self.dialogArray addObject: @"刚才在第五关攻击敌军头目的伤害值显示是黄色的"];
    [self.dialogArray addObject: @"这是因为驱逐舰具有防护作用,若敌军有驱逐舰存在,攻击任何非驱逐舰的敌军,产生的伤害值都会降低"];
    [self.dialogArray addObject: @"同时,敌军驱逐舰会有一定概率发射鱼雷"];
    [self.dialogArray addObject: @"如果被鱼雷击中可是很痛的;ex"];
    [self.dialogArray addObject: @"所以,请务必优先击破敌军舰队中的驱逐舰;"];
    [self.dialogArray addObject: @"那么,加油哦提督!;ex"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"做得漂亮!提督!"];
    
    
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
