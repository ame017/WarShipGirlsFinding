//
//  Level_20.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_20.h"

@interface Level_20 ()

@end

@implementation Level_20

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 20;
        self.characterName = @"战舰栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_zhanjianqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_zhanjianqiji_c"];
        self.endCharacterName = @"战舰栖姬";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(230*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    [destroyer updateInfoLabelText];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(70*X_P, 160*Y_P, 80*X_P, 35*Y_P)];
    [cruiser updateInfoLabelText];
    [self.enemyArray addObject:cruiser];
    
    AMEEnemyButton * zhanjianqiji = [AMEEnemyButton zhanjianqijiButton:self.level frame:CGRectMake(130*X_P, 50*Y_P, 100*X_P, 100*Y_P)];
    [self.enemyArray addObject:zhanjianqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"竟然...连续击败了...驱逐栖姬...和...轻巡栖鬼..."];
    [self.dialogArray addObject: @"但是...我...不会输给你...."];
    [self.dialogArray addObject: @"无论来多少次...都会把你...击沉..."];
    [self.dialogArray addObject: @"在铁...底...海峡...沉没吧....."];
    [self.dialogArray addObject: @"是战舰栖姬..敌军的战列舰头目;;"];
    [self.dialogArray addObject: @"啊..?!提督不要被她迷惑了!!赶紧指挥大家战斗哦!!"];
    [self.dialogArray addObject: @"(战舰栖姬若存在场上,敌军所有战舰攻击力提升10%)"];
    //结束的对话
    [self.endArray addObject:@"不行呢...."];
    [self.endArray addObject:@"有一天...这样...安静的...海里...我也..."];
    
    
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
