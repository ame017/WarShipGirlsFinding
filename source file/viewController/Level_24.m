//
//  Level_24.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_24.h"

@interface Level_24 ()

@end

@implementation Level_24

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 24;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * battleship = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(150*X_P, 120*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship];
    
    
    
    AMEEnemyButton * aircraftCarrier = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier];
    
    [self.dialogArray addObject: @"提督,发现敌人的一艘战列舰和一艘航空母舰"];
    [self.dialogArray addObject: @"这两艘船没有驱逐舰保护,现在是击退他们的好机会;ex"];
    [self.dialogArray addObject: @"抓住机会哦!提督!"];
    
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
