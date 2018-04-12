//
//  AMEEnemyButton.h
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/10.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMEEnemy.h"
#import "AMETools.h"

@interface AMEEnemyButton : UIButton
@property (nonatomic,retain) AMEEnemy * info;
@property (nonatomic) BOOL isFocus;
@property (nonatomic,retain) AMELabel * infoLabel;

+(instancetype)destroyerButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)cruiserButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)battleshipButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)aircraftCarrierButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)quzhuqijiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)qingxunqiguiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)zhanjianqijiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)kongmuqijiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)gangwanqijiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)zhongjianqijiButton:(NSUInteger)level frame:(CGRect)rect;
+(instancetype)beifangqijiButton:(NSUInteger)level frame:(CGRect)rect;

- (void)updateInfoLabelText;


@end
