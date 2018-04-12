//
//  Level_38.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_38.h"

@interface Level_38 ()

@end

@implementation Level_38

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 38;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * aircraftCarrier1 = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier1];
    
    AMEEnemyButton * aircraftCarrier2 = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(150*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier2];
    
    [self.dialogArray addObject: @"未来的关卡,敌军的战机将会变多"];
    [self.dialogArray addObject: @"之前向提督提出的提升放空等级提督是否重视了呢;ex"];
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
