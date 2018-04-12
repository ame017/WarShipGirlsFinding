//
//  Level_8.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_8.h"

@interface Level_8 ()

@end

@implementation Level_8

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 8;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser];
    
    [self.dialogArray addObject: @"报告提督,发现敌军巡洋舰!!"];
    [self.dialogArray addObject: @"巡洋舰的攻击频率比驱逐舰要低,但是伤害和血量要远高于驱逐舰!;ex"];
    [self.dialogArray addObject: @"请提督务必要小心!!"];
    [self.dialogArray addObject: @"同时,巡洋舰具有防空作用;"];
    [self.dialogArray addObject: @"只要敌军有巡洋舰存在,我方的飞航队道具产生的伤害会大幅度降低"];
    [self.dialogArray addObject: @"若想出动空军,请务必先击沉敌军的巡洋舰!!;ex"];
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
