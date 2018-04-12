//
//  Level_1_ViewController.h
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/6.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexViewController.h"
#import "AMETools.h"
#import "AMEPlayer.h"
#import "AMEWarShipGirsButton.h"
#import "AMESameJudger.h"
#import "AMEEnemyButton.h"
#import "AMEProgress.h"


#define BGM_BATTLE_COUNT 7
#define BGM_BOSS_COUNT 6

#define VOICE_AIRCRAFT_COUNT 3
#define VOICE_DETECTOR_COUNT 3
#define VOICE_REPAIR_COUNT 4
#define VOICE_TORPEDO_COUNT 3
#define VOICE_GAMESTART_COUNT 4
#define VOICE_EFFECT_FIRE_COUNT 3
#define VOICE_EFFECT_LEAK_COUNT 3
#define VOICE_FIRE_COUNT 8
#define VOICE_WIN_COUNT 5
#define VOICE_ZERO_COUNT 4
#define VOICE_LOSE_COUNT 3

@interface Basic_ViewController : UIViewController

@property (nonatomic) NSUInteger level;
@property (nonatomic,retain) NSMutableArray * enemyArray;
@property (nonatomic,retain) UIImage * backgroundImage;
@property (nonatomic) NSUInteger aircraftInterval;
@property (nonatomic) NSUInteger torpedoInterval;
@property (nonatomic) NSMutableArray * dialogArray;
@property (nonatomic) UIImage * character;
@property (nonatomic) UIImage * endCharacter;
@property (nonatomic) NSString * characterName;
@property (nonatomic) NSString * endCharacterName;
@property (nonatomic) NSMutableArray * endArray;
@property (nonatomic) AVAudioPlayer * bgmPlayer;


- (void)startTimer;
- (void)stopTimer;
- (void)running;
- (void)gameStart;



@end
