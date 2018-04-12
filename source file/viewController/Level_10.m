//
//  Level_10.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_10.h"

@interface Level_10 ()

@end

@implementation Level_10

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 10;
        self.characterName = @"轻巡栖鬼";
        self.character = [AMETools getPNGImageWithName:@"en_qingxunqigui_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_qingxunqigui_c"];
        self.endCharacterName = @"轻巡栖鬼";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(230*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    destroyer.info.nowLife = 1500;
    destroyer.info.allLife = 1500;
    [destroyer updateInfoLabelText];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(70*X_P, 160*Y_P, 80*X_P, 35*Y_P)];
    cruiser.info.nowLife = 2500;
    cruiser.info.allLife = 2500;
    [cruiser updateInfoLabelText];
    [self.enemyArray addObject:cruiser];
    
    AMEEnemyButton * qingxunqigui = [AMEEnemyButton qingxunqiguiButton:self.level frame:CGRectMake(140*X_P, 50*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:qingxunqigui];
    
    
    //开场的对话
    [self.dialogArray addObject: @"绝不...绝不让你得逞!!"];
    [self.dialogArray addObject: @"沉没到.....无法再次浮起的....深海中吧!!"];
    [self.dialogArray addObject: @"啊,是轻巡栖鬼,敌军的轻巡洋舰头目;;"];
    [self.dialogArray addObject: @"提督,请务必冷静指挥!;ex"];
    [self.dialogArray addObject: @"(轻巡栖鬼若存在场上,所有巡洋舰的伤害提高30%,同时,轻巡栖鬼具有小概率发射鱼雷的能力!)"];
    //结束的对话
    [self.endArray addObject:@"那就.....前进吧......前面有....."];
    [self.endArray addObject:@"呃..."];
    
    
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
