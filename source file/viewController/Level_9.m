//
//  Level_9.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_9.h"

@interface Level_9 ()

@end

@implementation Level_9

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 9;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * destroyer = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(50*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer];
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(150*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser];
    
    AMEEnemyButton * destroyer2 = [AMEEnemyButton destroyerButton:self.level frame:CGRectMake(250*X_P, 100*Y_P, 65*X_P, 30*Y_P)];
    [self.enemyArray addObject:destroyer2];
    
    [self.dialogArray addObject: @"连续玩了这么多关,提督也累了吧?"];
    [self.dialogArray addObject: @"玩游戏要适度哦!;ex"];
    //结束的对话
    [self.endArray addObject:@"打倒敌军了哦~"];
    [self.endArray addObject:@"做得漂亮!提督!"];
    
    
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
