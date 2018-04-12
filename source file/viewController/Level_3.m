//
//  Level_3.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/13.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_3.h"

@interface Level_3 ()

@end

@implementation Level_3

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 3;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    [self.dialogArray addObject: @"提督是否知道获得资源以后可以进行升级呢?"];
    [self.dialogArray addObject: @"获得各种资源以后,在主界面的改造界面可以进行等级的提升哦;ex"];
    [self.dialogArray addObject: @"如果等级不高,挑战关卡很吃力的话,可以考虑重复挑战以前的关卡来获得资源~;"];
    [self.dialogArray addObject: @"不过,如果重复挑战的话,获得的资源也会减半"];
    [self.dialogArray addObject: @"请提督务必合理分配时间!;ex"];
    [self.dialogArray addObject: @"那么,继续战斗吧!"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"加油哦,提督!"];
    
    
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
