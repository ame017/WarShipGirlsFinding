//
//  Level_14.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_14.h"

@interface Level_14 ()

@end

@implementation Level_14

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 14;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(100*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser1];
    
    AMEEnemyButton * cruiser2 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(200*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser2];
    
    [self.dialogArray addObject: @"如果提督不希望听到游戏的音乐或者音效"];
    [self.dialogArray addObject: @"可以在设置页面里关掉哦"];
    [self.dialogArray addObject: @"关闭机身侧面的声音开关,也是可以关闭音乐和音效的"];
    [self.dialogArray addObject: @"不过,提督一定想听到我们可爱的声音吧~?;ex"];
    [self.dialogArray addObject: @"对吧~对吧~?!"];
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
