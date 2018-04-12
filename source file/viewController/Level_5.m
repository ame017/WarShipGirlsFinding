//
//  Level_5.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/13.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_5.h"

@interface Level_5 ()

@end

@implementation Level_5
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 5;
        self.characterName = @"驱逐栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_quzhuqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_quzhuqiji_c"];
        self.endCharacterName = @"驱逐栖姬";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(230*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    destroyer1.info.nowLife = 1000;
    destroyer1.info.allLife = 1000;
    [destroyer1 updateInfoLabelText];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(70*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    destroyer2.info.nowLife = 1000;
    destroyer2.info.allLife = 1000;
    [destroyer2 updateInfoLabelText];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * quzhiqiji = [AMEEnemyButton quzhuqijiButton:self.level frame:CGRectMake(140*X_P, 50*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:quzhiqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"先头的...驱逐舰...都被...击沉了...."];
    [self.dialogArray addObject: @"我...绝不...让你...打中..."];
    [self.dialogArray addObject: @"啊,好像是敌军的头目;;"];
    [self.dialogArray addObject: @"这场战斗的难度提高了不少,提督要加油哦!;ex"];
    [self.dialogArray addObject: @"(驱逐栖姬若存在场上,所有驱逐舰的伤害提高20%.驱逐栖姬的鱼雷发射率为普通驱逐舰的2倍)"];
    //结束的对话
    [self.endArray addObject:@"好痛..."];
    [self.endArray addObject:@"月亮...月亮...真美..."];
    
    
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
