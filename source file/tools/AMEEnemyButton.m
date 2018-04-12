//
//  AMEEnemyButton.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/10.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEEnemyButton.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define TEXT_GREEN [UIColor colorWithRed:110/255.0 green: 180/255.0 blue:110/255.0 alpha:1]
#define TEXT_RED [UIColor colorWithRed:1.0 green:110/255.0 blue:110/255.0 alpha:1]


#define X_P WIDTH/375.0
#define Y_P HEIGHT/667.0

@implementation AMEEnemyButton


+(instancetype)destroyerButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy destroyer:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_DD"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_DD_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}
+(instancetype)cruiserButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy cruiser:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_CA"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_CA_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
    
}
+(instancetype)battleshipButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy battleship:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_BB"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_BB_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}
+(instancetype)aircraftCarrierButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy aircraftCarrier:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_CV"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_CV_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

+(instancetype)quzhuqijiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy quzhuqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_quzhuqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_quzhuqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

+(instancetype)qingxunqiguiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy qingxunqigui:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_qingxunqigui"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_qingxunqigui_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}
+(instancetype)zhanjianqijiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy zhanjianqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_zhanjianqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_zhanjianqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

+(instancetype)kongmuqijiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy kongmuqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_kongmuqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_kongmuqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

+(instancetype)gangwanqijiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy gangwanqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_gangwanqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_gangwanqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

+(instancetype)zhongjianqijiButton:(NSUInteger)level frame:(CGRect)rect;{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy zhongjianqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_zhongjianqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_zhongjianqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}
+(instancetype)beifangqijiButton:(NSUInteger)level frame:(CGRect)rect{
    AMEEnemyButton * en_btn = [AMEEnemyButton new];
    en_btn.info = [AMEEnemy beifangqiji:level];
    en_btn.frame = rect;
    [en_btn setImage:[UIImage imageNamed:@"en_beifangqiji"] forState:UIControlStateNormal];
    [en_btn setImage:[UIImage imageNamed:@"en_beifangqiji_die"] forState:UIControlStateDisabled];
    en_btn.isFocus = NO;
    return en_btn;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self createInfoLabel];
}

- (void)setCenter:(CGPoint)center{
    [super setCenter:center];
    [self createInfoLabel];
}


- (void)createInfoLabel{
    switch (self.info.shipType) {
        case en_destroyer:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"敌驱逐舰\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_cruiser:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"敌巡洋舰\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_battleship:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"敌战列舰\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_aircraftCarrier:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"敌航空母舰\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_quzhuqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"驱逐栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_qingxunqigui:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"轻巡栖鬼\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_zhanjianqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"战舰栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_kongmuqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"空母栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_gangwanqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"港湾栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_zhongjianqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"中间栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
        case en_beifangqiji:
            self.infoLabel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"北方栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife] strokeWidth:2.0 size:12];
            break;
    }
    self.infoLabel.numberOfLines = 2;
    self.infoLabel.frame = CGRectMake(self.frame.origin.x-10*X_P,self.frame.origin.y+self.frame.size.height+5, self.frame.size.width+20*X_P, 35);
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.alpha = 0.8;
}

- (void)updateInfoLabelText{
    switch (self.info.shipType) {
        case en_destroyer:
            self.infoLabel.text = [NSString stringWithFormat:@"敌驱逐舰\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_cruiser:
            self.infoLabel.text = [NSString stringWithFormat:@"敌巡洋舰\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_battleship:
            self.infoLabel.text = [NSString stringWithFormat:@"敌战列舰\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_aircraftCarrier:
            self.infoLabel.text = [NSString stringWithFormat:@"敌航空母舰\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_quzhuqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"驱逐栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_qingxunqigui:
            self.infoLabel.text = [NSString stringWithFormat:@"轻巡栖鬼\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_zhanjianqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"战舰栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_kongmuqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"空母栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_gangwanqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"港湾栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_zhongjianqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"中间栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
        case en_beifangqiji:
            self.infoLabel.text = [NSString stringWithFormat:@"北方栖姬\n %lu/%lu",self.info.nowLife,self.info.allLife];
            break;
    }
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    [self.infoLabel removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
