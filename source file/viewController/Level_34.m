//
//  Level_34.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/14.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Level_34.h"

@interface Level_34 ()

@end

@implementation Level_34

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = 34;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMEEnemyButton * aircraftCarrier1 = [AMEEnemyButton  aircraftCarrierButton:self.level frame:CGRectMake(250*X_P, 50*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject: aircraftCarrier1];
    
    AMEEnemyButton * battleship2 = [AMEEnemyButton battleshipButton:self.level frame:CGRectMake(50*X_P, 100*Y_P, 100*X_P, 40*Y_P)];
    [self.enemyArray addObject:battleship2];
    
    AMEEnemyButton * cruiser1 = [AMEEnemyButton cruiserButton:self.level frame:CGRectMake(170*X_P, 100*Y_P, 80*X_P, 35*Y_P)];
    [self.enemyArray addObject:cruiser1];
    
    [self.dialogArray addObject: @"敌军的航母增多以后"];
    [self.dialogArray addObject: @"请提督记得备好损管组道具;ex"];
    [self.dialogArray addObject: @"不然起火了就惨了~"];
    [self.dialogArray addObject: @"什么?!提督喜欢看我们衣服被烧坏的样子?;"];
    [self.dialogArray addObject: @"呜呜呜....提督是!!!笨蛋!!!"];
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
