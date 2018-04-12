//
//  Level_30.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_30.h"

@interface Level_30 ()

@end

@implementation Level_30

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 30;
        self.characterName = @"港湾栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_gangwanqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_gangwanqiji_c"];
        self.endCharacterName = @"港湾栖姬";
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
    
    AMEEnemyButton * gangwanqiji = [AMEEnemyButton gangwanqijiButton:self.level frame:CGRectMake(250*X_P, 70*Y_P, 120*X_P, 100*Y_P)];
    [self.enemyArray addObject:gangwanqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"竟然...击沉了...我即将...回港..的..队友.."];
    [self.dialogArray addObject: @"你们什么...什么都...不懂....!!"];
    [self.dialogArray addObject: @"这次是港湾栖姬..敌军的防御类型头目;;"];
    [self.dialogArray addObject: @"看来她的防御很坚固,攻击她的部下是最好的选择;ex"];
    [self.dialogArray addObject: @"(港湾栖姬是敌军的防御型头目,若港湾栖姬存在场上,敌军舰队全体战舰所受伤害降低15%,过关无需击沉港湾栖姬,只要击沉敌军其他战舰,即可顺利过关.)"];
    //结束的对话
    [self.endArray addObject:@"都说了......不要来...."];
    [self.endArray addObject:@"总有一天....我们还会....回来的..."];
    
    
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
