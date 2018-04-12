//
//  Level_21.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_21.h"

@interface Level_21 ()

@end

@implementation Level_21

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 21;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer1 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(100*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer1];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(200*X_P, 120*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    
    
    AMEEnemyButton * battleship = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(150*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship];
    
    [self.dialogArray addObject: @"呼...总算是有惊无险..击退了战舰栖姬"];
    [self.dialogArray addObject: @"提督差点就被她捉走了呢...."];
    [self.dialogArray addObject: @"接下来的战斗,敌军会变得比之前更强;ex"];
    [self.dialogArray addObject: @"请提督做好万全的准备再来战斗"];
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
