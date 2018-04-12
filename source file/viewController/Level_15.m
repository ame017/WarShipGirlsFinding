//
//  Level_15.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_15.h"

@interface Level_15 ()

@end

@implementation Level_15

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 15;
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
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(280*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    destroyer1.info.nowLife = 2000;
    destroyer1.info.allLife = 2000;
    [destroyer1 updateInfoLabelText];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(20*X_P, 160*Y_P, 65*X_P, 30*Y_P)];
    destroyer2.info.nowLife = 2000;
    destroyer2.info.allLife = 2000;
    [destroyer2 updateInfoLabelText];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * quzhuqiji = [AMEEnemyButton quzhuqijiButton:self.level frame:CGRectMake(100*X_P, 70*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:quzhuqiji];
    
    
    AMEEnemyButton * qingxunqigui = [AMEEnemyButton qingxunqiguiButton:self.level frame:CGRectMake(200*X_P, 70*Y_P, 80*X_P, 100*Y_P)];
    [self.enemyArray addObject:qingxunqigui];
    
    
    //开场的对话
    [self.dialogArray addObject: @"可恶..."];
    [self.dialogArray addObject: @"这一次...绝对..不让你得逞..."];
    [self.dialogArray addObject: @"月亮....真美...;en_quzhuqiji_c;驱逐栖姬"];
    [self.dialogArray addObject: @"在月光下....绝对要..击破你..."];
    [self.dialogArray addObject: @"啊,这次来了两个敌人的头目;;"];
    [self.dialogArray addObject: @"麻烦了呢....."];
    [self.dialogArray addObject: @"不过....我们相信提督...一定会带领我们获得胜利的.."];
    //结束的对话
    [self.endArray addObject:@"啧....你们...给我记住了..."];
    
    
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
