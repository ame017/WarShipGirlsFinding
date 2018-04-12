//
//  Level_44.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_44.h"

@interface Level_44 ()

@end

@implementation Level_44

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 44;
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * aircraftCarrier = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(30*X_P, 130*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier];

    
    AMEEnemyButton * kongmuqiji = [AMEEnemyButton kongmuqijiButton:self.level frame:CGRectMake(150*X_P, 50*Y_P, 100*X_P, 100*Y_P)];
    [self.enemyArray addObject:kongmuqiji];
    
    AMEEnemyButton * gangwanqiji = [AMEEnemyButton gangwanqijiButton:self.level frame:CGRectMake(250*X_P, 70*Y_P, 120*X_P, 100*Y_P)];
    [self.enemyArray addObject:gangwanqiji];
    
    [self.dialogArray addObject: @"提督!准备好了吗?"];
    [self.dialogArray addObject: @"在拂晓的水平线上刻下胜利吧!!;ex"];
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
