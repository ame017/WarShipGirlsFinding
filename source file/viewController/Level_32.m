//
//  Level_32.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_32.h"

@interface Level_32 ()

@end

@implementation Level_32

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 32;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(50*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser1];
    
    AMEEnemyButton * cruiser2 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(150*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser2];
    
    AMEEnemyButton * cruiser3 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(250*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser3];
    
    [self.dialogArray addObject: @"无论敌军是怎样的配置,都不会对雷击组道具的伤害产生影响"];
    [self.dialogArray addObject: @"所以适当使用雷击组是很明智的选择哦;ex"];
    
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
