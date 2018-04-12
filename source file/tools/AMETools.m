//
//  AMETools.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMETools.h"





@implementation AMETools

+ (UIImage *)getImageWithName:(NSString *)name extension:(NSString *)extension{
    NSString * path = [[NSBundle mainBundle]pathForResource:name ofType:extension];
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)getPNGImageWithName:(NSString *)name{
    NSString * path = [[NSBundle mainBundle]pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}

+ (AVAudioPlayer *)getPlayerWithFileName:(NSString *)fileName Extension:(NSString *)extension RuntimeCount:(NSInteger) runtimeCount{
    AVAudioPlayer * player = [AVAudioPlayer new];
    NSURL * path = [[NSBundle mainBundle]URLForResource:fileName withExtension:extension];
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:path error:nil];
    player.numberOfLoops=runtimeCount-1;
    return player;
}

+ (AVAudioPlayer *)getMP3PlayerWithFileName:(NSString *)fileName RuntimeCount:(NSInteger) runtimeCount{
    AVAudioPlayer * player = [AVAudioPlayer new];
    NSURL * path = [[NSBundle mainBundle]URLForResource:fileName withExtension:@"mp3"];
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:path error:nil];
    player.numberOfLoops=runtimeCount-1;
    return player;
}

+ (AVAudioPlayer *)getWAVPlayerWithFileName:(NSString *)fileName RuntimeCount:(NSInteger) runtimeCount{
    AVAudioPlayer * player = [AVAudioPlayer new];
    NSURL * path = [[NSBundle mainBundle]URLForResource:fileName withExtension:@"wav"];
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:path error:nil];
    player.numberOfLoops=runtimeCount-1;
    return player;
}

#pragma mark 生成switch模式的button
+ (UIButton *)createSwitchButtonWithSelected:(BOOL)selected{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"switch_on"] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:@"switch_off"] forState:UIControlStateNormal];
    [btn setSelected:selected];
    return btn;
}

#pragma mark 生成done button
+ (UIButton *)createDoneButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"done_btn_black"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"done_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

#pragma mark 生成change button
+ (UIButton *)createChangeButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"dischange_btn"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"change_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

#pragma mark 生成lv_up button
+ (UIButton *)createLvUpButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"lv_up_btn_black"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"lv_up_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}


+ (NSString *)addOrSubtractWithStr:(NSString *)str num:(NSInteger)num{
    NSInteger strNum = [str integerValue];
    strNum += num;
    return [NSString stringWithFormat:@"%lu",strNum];
}

+ (UIImageView *) makeRotation:(UIImageView *)image speedX:(float)X speedY:(float)Y
{
    if (Y<0) {
        image.transform = CGAffineTransformMakeRotation(atan(X/(-Y)));
    }else if(Y>0){
        image.transform = CGAffineTransformMakeRotation(atanf(X/(-Y))-M_PI);
    }
    return image;
}

#pragma mark 生成buy button
+ (UIButton *)createBuyButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"p_buy_btn_black"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"p_buy_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

#pragma mark 生成关卡button
+ (AMELevelButton *)createLevelButtonWithAble:(BOOL)able level:(NSUInteger)level{
    AMELevelButton * btn = [AMELevelButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"level%lu_black",level]] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"level%lu",level]] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

#pragma mark 生成返回button
+ (UIButton *)createReturnButton{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"return_btn"] forState:UIControlStateNormal];
    btn.tag = 999;
    return btn;
}

#pragma mark 创建二级栏
+ (UIImageView *)createSecBoxWith:(UIImage *)image{
    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0, HEIGHT/2.0, 1, 1)];
    view.image = image;
    return view;
}



#pragma mark 生成描边的label
+ (AMELabel *)createAMELabelWithText:(NSString *)text strokeWidth:(float)strokeWidth size:(float)size{
    AMELabel * lbl = [[AMELabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    lbl.text = text;
    lbl.strokeColor = [UIColor blackColor];
    lbl.fillColor = [UIColor whiteColor];
    lbl.verticalAlignment = VerticalAlignmentTop;
    lbl.strokeWidth = strokeWidth*X_P*Y_P;
    lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:size*X_P];
    return lbl;
}
#pragma mark 生成左箭头
+ (UIButton *)createLeftButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"left_btn_balck"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"left_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

#pragma mark 生成右箭头
+ (UIButton *)createRightButtonWithAble:(BOOL)able{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"right_btn_balck"] forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:@"right_btn"] forState:UIControlStateNormal];
    btn.enabled = able;
    return btn;
}

@end
