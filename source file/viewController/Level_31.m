//
//  Level_31.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_31.h"

@interface Level_31 ()

@end

@implementation Level_31

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 31;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(150*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    AMEEnemyButton * destroyer3 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(250*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer3];
    
    AMEEnemyButton * aircraftCarrier = [AMEEnemyButton aircraftCarrierButton:self.level frame:CGRectMake(230*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:aircraftCarrier];
    
    [self.dialogArray addObject: @"噫...上一关敌军的防御力真是恐怖呢..."];
    [self.dialogArray addObject: @"对于港湾栖姬这样的头目,确实没有太有效的解决办法;ex"];
    [self.dialogArray addObject: @"不过提督可以考虑优先击沉敌军巡洋舰后,再进行飞航队打击"];
    
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
