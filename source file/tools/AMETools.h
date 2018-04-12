//
//  AMETools.h
//  WarShipGirlsFinding
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AMELabel.h"
#import "AMELevelButton.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define X_P WIDTH/375.0
#define Y_P HEIGHT/667.0

#define GOLDEN_SECTION 0.618

@interface AMETools : NSObject

+ (UIImage *)getImageWithName:(NSString *)name extension:(NSString *)extension;
+ (UIImage *)getPNGImageWithName:(NSString *)name;
+ (UIButton *)createSwitchButtonWithSelected:(BOOL)selected;
+ (UIButton *)createChangeButtonWithAble:(BOOL)able;
+ (UIButton *)createLeftButtonWithAble:(BOOL)able;
+ (UIButton *)createRightButtonWithAble:(BOOL)able;
+ (AMELabel *)createAMELabelWithText:(NSString *)text strokeWidth:(float)strokeWidth size:(float)size;
+ (UIButton *)createLvUpButtonWithAble:(BOOL)able;
+ (UIButton *)createBuyButtonWithAble:(BOOL)able;
+ (UIButton *)createReturnButton;
+ (UIImageView *)createSecBoxWith:(UIImage *)image;
+ (NSString *)addOrSubtractWithStr:(NSString *)str num:(NSInteger)num;
+ (UIButton *)createDoneButtonWithAble:(BOOL)able;
+ (AMELevelButton *)createLevelButtonWithAble:(BOOL)able level:(NSUInteger)level;
+ (UIImageView *) makeRotation:(UIImageView *)image speedX:(float)X speedY:(float)Y;

+ (AVAudioPlayer *)getPlayerWithFileName:(NSString *)fileName Extension:(NSString *)extension RuntimeCount:(NSInteger) runtimeCount;
+ (AVAudioPlayer *)getMP3PlayerWithFileName:(NSString *)fileName RuntimeCount:(NSInteger) runtimeCount;+ (AVAudioPlayer *)getWAVPlayerWithFileName:(NSString *)fileName RuntimeCount:(NSInteger) runtimeCount;

@end
