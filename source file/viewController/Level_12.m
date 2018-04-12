//
//  Level_12.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_12.h"

@interface Level_12 ()

@end

@implementation Level_12

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 12;
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
    
    AMEEnemyButton * cruiser = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(140*X_P, 60*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser];
    
    [self.dialogArray addObject: @"提督是否知道可以在设置界面更改为您服务的舰娘呢?"];
    [self.dialogArray addObject: @"在镇守府,点击设置界面即可看到相关选项哦;ex"];
    [self.dialogArray addObject: @"提督最喜欢我了,对吧~?;"];
    [self.dialogArray addObject: @"哦对了,作者也向广大提督征集原创舰娘立绘"];
    [self.dialogArray addObject: @"如果有兴趣的话,可以向作者投稿哦!;ex"];
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
