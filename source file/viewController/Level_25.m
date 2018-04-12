//
//  Level_25.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_25.h"

@interface Level_25 ()

@end

@implementation Level_25

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 25;
        self.characterName = @"空母栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_kongmuqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_kongmuqiji_c"];
        self.endCharacterName = @"空母栖姬";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(170*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(70*X_P, 160*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser];
    
    AMEEnemyButton * kongmuqiji = [AMEEnemyButton kongmuqijiButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 100*Y_P)];
    [self.enemyArray addObject:kongmuqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"可恶....我走失的...战列舰..和航母...被你偷偷击沉了"];
    [self.dialogArray addObject: @"不可...原谅...!!"];
    [self.dialogArray addObject: @"化作...火球...沉没吧...!!!!"];
    [self.dialogArray addObject: @"是空母栖姬..敌军航空母舰头目;;"];
    [self.dialogArray addObject: @"刚才那一关击沉的两艘敌舰似乎是她的下属"];
    [self.dialogArray addObject: @"看来她心情很不好呢"];
    [self.dialogArray addObject: @"趁着她愤怒的时候赶紧击退她吧;ex"];
    [self.dialogArray addObject: @"(空母栖姬是敌军的特殊航母单位,她存在场上时,敌军的所有敌机伤害提高10%,同时,轰炸造成的起火概率提高25%)"];
    //结束的对话
    [self.endArray addObject:@"好安静....好舒服....这样啊....所以我...."];
    [self.endArray addObject:@"不管几次.....都会重来的....只要....没有改变...."];
    
    
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
