//
//  Level_48.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_48.h"

@interface Level_48 ()

@end

@implementation Level_48

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 48;
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * quzhiqiji = [AMEEnemyButton quzhuqijiButton:self.level frame:CGRectMake(100*X_P, 50*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:quzhiqiji];
    
    AMEEnemyButton * qingxunqigui = [AMEEnemyButton qingxunqiguiButton:self.level frame:CGRectMake(200*X_P, 50*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:qingxunqigui];
    
    AMEEnemyButton * zhanjianqiji = [AMEEnemyButton zhanjianqijiButton:self.level frame:CGRectMake(10*X_P, 130*Y_P, 100*X_P, 100*Y_P)];
    [self.enemyArray addObject:zhanjianqiji];
    
    AMEEnemyButton * gangwanqiji = [AMEEnemyButton gangwanqijiButton:self.level frame:CGRectMake(250*X_P, 170*Y_P, 120*X_P, 100*Y_P)];
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
