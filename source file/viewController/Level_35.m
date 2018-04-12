//
//  Level_35.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_35.h"

@interface Level_35 ()

@end

@implementation Level_35

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 35;
        self.characterName = @"中间栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_zhongjianqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_zhongjianqiji_c"];
        self.endCharacterName = @"中间栖姬";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(170*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(90*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(140*X_P, 90*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser1];
    
    AMEEnemyButton * cruiser2 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(40*X_P, 90*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser2];
    
    AMEEnemyButton * zhongjianqiji = [AMEEnemyButton zhongjianqijiButton:self.level frame:CGRectMake(250*X_P, 70*Y_P, 120*X_P, 100*Y_P)];
    [self.enemyArray addObject:zhongjianqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"不知好歹地...又来了吗....呵呵....呵...."];
    [self.dialogArray addObject: @"不管几次....都给我沉下去！"];
    [self.dialogArray addObject: @"中间栖姬,敌军的治疗型头目;;"];
    [self.dialogArray addObject: @"她的攻击力适中,不过,似乎会在一定时间间隔给其他敌舰恢复战斗力呢;ex"];
    [self.dialogArray addObject: @"(中间栖姬是敌军的治疗型头目,若中间栖姬存在场上,每2分钟会维修敌军全体战舰40%的生命值)"];
    //结束的对话
    [self.endArray addObject:@"我居然会....沉没吗......怎么会...?!"];
    
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
