//
//  Level_40.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_40.h"

@interface Level_40 ()

@end

@implementation Level_40

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 40;
        self.characterName = @"北方栖姬";
        self.character = [AMETools getPNGImageWithName:@"en_beifangqiji_c"];
        self.endCharacter = [AMETools getPNGImageWithName:@"en_beifangqiji_c"];
        self.endCharacterName = @"北方栖姬";
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_boss_%u",arc4random()%BGM_BOSS_COUNT] RuntimeCount:0];
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_boss"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 170*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * aircraftCarrier = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(130*X_P, 90*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:aircraftCarrier];
    
    AMEEnemyButton * beifangqiji = [AMEEnemyButton beifangqijiButton:self.level frame:CGRectMake(230*X_P, 70*Y_P, 120*X_P, 100*Y_P)];
    [self.enemyArray addObject:beifangqiji];
    
    
    //开场的对话
    [self.dialogArray addObject: @"把零战....留下来....!!"];
    [self.dialogArray addObject: @"哎?零战?;;"];
    [self.dialogArray addObject: @"那...把烈风...留下来...!!;self;"];
    [self.dialogArray addObject: @"哎哎哎?!;;"];
    [self.dialogArray addObject: @"什么都没有,你这种人最多只能活两集...!!;self;"];
    [self.dialogArray addObject: @"噗..是北方栖姬,敌军最可爱的头目;;"];
    [self.dialogArray addObject: @"头目类型,似乎是空中支援型"];
    [self.dialogArray addObject: @"(北方栖姬是敌军的空中支援型头目,若北方栖姬在场上的话,敌军所有航母出动战机的时间间隔减少30%)"];
    //结束的对话
    [self.endArray addObject:@"有一天....要在快乐的海上....有一天...."];
    [self.endArray addObject:@"呸..什么鬼台词....!!还能不能一起愉快的玩耍了!!"];
    
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
