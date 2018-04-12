//
//  Level_1_ViewController.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/6/6.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "Basic_ViewController.h"
#import "AMEImage.h"



#define TEXT_GREEN [UIColor colorWithRed:110/255.0 green: 180/255.0 blue:110/255.0 alpha:1]
#define TEXT_RED [UIColor colorWithRed:1.0 green:110/255.0 blue:110/255.0 alpha:1]


#define SIZE_X (WIDTH/5.0-2)
#define SIZE_Y (_WSGView.frame.size.height/3.0-2)





#define FIRE_DAMAGE_ONE_SEC 0.5
#define LEAK_DAMAGE_ONE_SEC 0.8

#define FIRE_TIME_DURATION 40
#define LEAK_TIME_DURATION 30

#define AIRCRAFT_BASIC_DAMAGE 1500
#define TORPEDO_BASIC_DAMAGE 600

#define ENEMY_AIRCRAFT_DAMAGE 20.0
#define PLAYER_BASIC_DAMAGE 50

#define ZHONGJIANQIJI_LIFE_UP_INTTERVAL (60*2)
#define ZHONGJIANQIJI_LIFE_UP_PERCENT 0.4

#define TEXT_GREEN [UIColor colorWithRed:110/255.0 green: 180/255.0 blue:110/255.0 alpha:1]
#define TEXT_RED [UIColor colorWithRed:1.0 green:110/255.0 blue:110/255.0 alpha:1]


#define BASIC_REWARD (long)((pow(self.level*2*25*self.level*2*25,1.0/3)*1.6+20)/2.5)
#define BASIC_FUEL ((100+self.level*5)/2.5)
#define COIN_REWARD (long)((pow(self.level*self.level*self.level*8,1.0/2.0)*40*2.5+1000))

typedef NS_ENUM(NSUInteger,playerLifeDownType){
    playerLifeDownTypeNormal    = 0,
    playerLifeDownTypeDOT       = 1,
    playerLifeDownTypeIntensive = 2,
    playerLifeDownTypeSelf      = 3
};

@interface Basic_ViewController ()
{
    NSTimer * _timer;
    NSUInteger _timerRunningTime;
    AMESave * _save;
    AMEPlayer * _mainPlayer;
    AMESameJudger * _mainJudger;
    float _playerLifeNow;
    
    UIImageView * _bg;
    
    UIImageView * _bottomView;
    UIButton * _fire_btn;
    UIButton * _torpedo_btn;
    AMELabel * _torpedo_res;
    UIButton * _aircraft_btn;
    AMELabel * _aircraft_res;
    UIButton * _detector_btn;
    AMELabel * _detector_res;
    UIButton * _repair_btn;
    AMELabel * _repair_res;
    NSMutableArray * _bottom_btn_array;
    
    AMEProgress * _playerLifeView;
    UIScrollView * _WSGView;
    NSMutableArray * _WSGView_array;
    
    UIView * _selectedView;
    NSMutableArray * _selectedView_array;
    BOOL _selectedIndex1;
    BOOL _selectedIndex2;
    BOOL _selectedIndex3;
    
    BOOL _detectorON;
    NSUInteger _detectorStartRunTime;
    
    NSMutableArray * _fire_effect_array;
    BOOL _isFire;
    NSUInteger _fireStartRunTime;
    
    NSMutableArray * _leak_effect_array;
    BOOL _isLeak;
    NSUInteger _leakStartRunTime;
    
    UIImageView * _focusView;
    
    UIImageView * _top_box;
    NSMutableArray * _top_btn_array;
    
    UIImageView * _noticeBox;
    
    NSUInteger _att_0_count;
    NSUInteger _att_1_count;
    NSUInteger _att_2_count;
    NSUInteger _att_3_count;
    NSUInteger _att_4_count;
    NSUInteger _att_5_count;
    NSUInteger _att_6_count;
    NSUInteger _att_7_count;
    
    //人物
    UIImageView * _characterView;
    
    //对话框
    UIControl * _dialogBox;
    AMELabel * _dialogTilte_lbl;
    AMELabel * _text_lbl;
    NSUInteger _dialog_index;
    
    BOOL isStart;
    
    NSUInteger _destroyerCount;
    NSUInteger _cruiserCount;
    BOOL _isQuzhuqiji;
    BOOL _isQingxunqigui;
    BOOL _isZhanjianqiji;
    BOOL _isKongmuqiji;
    BOOL _isGangwanqiji;
    BOOL _isZhongjianqiji;
    BOOL _isBeifangqiji;
    NSUInteger _beifangDieTime;//为了解决在差值区间北方死亡造成两波连续轰炸的情况
    
    AVAudioPlayer * _sePlayer;
    AVAudioPlayer * _playerFirePlayer;
    AVAudioPlayer * _enemyFirePlayer;
    AVAudioPlayer * _enemyFireBoomPlayer;
    AVAudioPlayer * _aircraftBoomPlayer;
    AVAudioPlayer * _detectorPlayer;
    AVAudioPlayer * _torpedoPlayer;
    AVAudioPlayer * _repairPlayer;
    AVAudioPlayer * _wsgPlayer;
    AVAudioPlayer * _aircraftPlayer;
    AVAudioPlayer * _enemyAircraftPlayer;
    AVAudioPlayer * _fireEffectPlayer;
    AVAudioPlayer * _leakEffectPlayer;
    AVAudioPlayer * _torpedoComing;
    AVAudioPlayer * _voicePlayer1;
    AVAudioPlayer * _voicePlayer2;
}

@end

@implementation Basic_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(home) name:@"home" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(back) name:@"back" object:nil];
    
    
    //处理存档
     NSUInteger saveIndex = [[[NSUserDefaults standardUserDefaults]objectForKey:@"lastSave"] integerValue];
    _save = [AMESave new];
    _mainPlayer = [AMEPlayer defualtPlayer];
    [_save loadWithIndex:saveIndex];
    [self loadSaveToPlayer:_save];
    
    if (_mainPlayer.bgmOpen) {
        _bgmPlayer.volume = 0.7;
        [_bgmPlayer play];
    }
    
    //实例化samejudger;
    _mainJudger = [AMESameJudger defualtJudger];
    //生成界面
    _bg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _bg.image = self.backgroundImage;
    [self.view addSubview:_bg];
    //生成顶部条
//    [self createTopBox];
    //顶部按钮
    [self createTopButton];
    //生成玩家血条
    [self createPlayerLifeView];
    //生成底部
    [self createBottomView];
    //生成舰娘槽
    [self createWSGView];
    //生成选择框
    [self createSelectedView];
    //生成异常状态
    [self createFireEffectView];
    [self createLeakEffectView];
    
    _enemyArray = [NSMutableArray arrayWithCapacity:1];
    _dialogArray = [NSMutableArray arrayWithCapacity:0];
    _endArray = [NSMutableArray arrayWithCapacity:0];
}


#pragma mark timer的方法
- (void)startTimer{
    if (_timer) {
        [_timer invalidate];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(running) userInfo:nil repeats:YES];
}

- (void)stopTimer{
    [_timer invalidate];
}



#pragma mark 主控制方法
- (void)running{
    _timerRunningTime++;
    [self checkFireDOT];
    [self checkLeakDOT];
    [self checkDetctorEnable];
    [self checkBullet];
    [self checkEnemyTorpedo];
    [self checkEnemyAircraft];
    [self checkZhongjianqiji];
    
    //防止数据类型越界 计时器1000W次的时候归零一次
    if (_timerRunningTime>9999999) {
        _timerRunningTime = 0;
    }
}

#pragma mark 中间栖姬的奶...(什么鬼)
- (void)checkZhongjianqiji{
    if (_isZhongjianqiji&&_timerRunningTime!=0&&_timerRunningTime%ZHONGJIANQIJI_LIFE_UP_INTTERVAL==0) {
        for (AMEEnemyButton * btn in _enemyArray) {
            [self enemyDamaged:-btn.info.allLife*ZHONGJIANQIJI_LIFE_UP_PERCENT enemyBtn:btn yellow:NO];
        }
    }
}

#pragma mark 创建顶部三个button
- (void)createTopButton{
    _top_btn_array = [NSMutableArray arrayWithCapacity:3];
    UIButton * back = [[UIButton alloc]initWithFrame:CGRectMake(10*X_P, 20*Y_P, 35*X_P, 35*Y_P)];
    [back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [_top_btn_array addObject:back];
    
    UIButton * pause = [[UIButton alloc]initWithFrame:CGRectMake(50*X_P, 22*Y_P, 35*X_P, 35*Y_P)];
    [pause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    [pause setImage:[UIImage imageNamed:@"start"] forState:UIControlStateSelected];
    [_top_btn_array addObject:pause];
    
//    UIButton * sound = [[UIButton alloc]initWithFrame:CGRectMake(80*X_P, 42*Y_P, 25*X_P, 25*Y_P)];
//    [sound setImage:[UIImage imageNamed:@"sound_on"] forState:UIControlStateNormal];
//    [sound setImage:[UIImage imageNamed:@"sound_off"] forState:UIControlStateSelected];
//    if (_mainPlayer.seOpen||_mainPlayer.bgmOpen) {
//        sound.selected = NO;
//    }else{
//        sound.selected = YES;
//    }
//    [_top_btn_array addObject:sound];
    
    int i=0;
    for (UIButton * btn in _top_btn_array) {
        btn.tag = 900+i;
        [btn addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        i++;
    }
}

#pragma mark 顶部
- (void)createTopBox{
    _top_box = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.06)];
    _top_box.image = [UIImage imageNamed:@"top_box"];
    [self.view addSubview:_top_box];
}


#pragma mark 玩家掉血与死亡
-(void)playerLifeDownAndDieCheckWithDamage:(float)damage colorType:(playerLifeDownType)type{
    _playerLifeNow -= damage;
    _playerLifeView.progress = _playerLifeNow/100.0;
    
    AMELabel * effect = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"-%lu",(NSUInteger)(damage*100*(1+self.level*0.1))] strokeWidth:2.0 size:15];
    effect.alpha = 0;
    switch (type) {
        case playerLifeDownTypeDOT:
            //黄色
            effect.fillColor = [UIColor colorWithRed:1.0 green:245/255.0 blue:90/255.0 alpha:1.0];
            break;
        case playerLifeDownTypeSelf:
            //红色
            effect.fillColor = TEXT_RED;
            break;
        case playerLifeDownTypeIntensive:
            effect.fillColor = TEXT_GREEN;
            break;
        case playerLifeDownTypeNormal:
            effect.fillColor = [UIColor whiteColor];
            break;
            
    }
    effect.frame = CGRectMake(0, 0, 100, 20*Y_P);
    effect.center = CGPointMake(WIDTH-80*X_P,_playerLifeView.frame.origin.y+30*Y_P);
    effect.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:effect];
    [UIView animateWithDuration:1.0 animations:^{
        effect.alpha = 1;
        effect.center = CGPointMake(WIDTH-80*X_P,_playerLifeView.frame.origin.y-10*Y_P);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            effect.alpha = 0;
            effect.center = CGPointMake(WIDTH-80*X_P,_playerLifeView.frame.origin.y-20*Y_P);
        } completion:^(BOOL finished) {
            [effect removeFromSuperview];
        }];
    }];

    if (_playerLifeNow<=0) {
        NSLog(@"玩家死了");//执行死亡方法
        [self stopTimer];
        //避免同时遭到2次炮击弹框2次
        
        static BOOL created=NO;
        if (created==NO) {
            created = YES;
            if (_mainPlayer.bgmOpen) {
                [_bgmPlayer stop];
                _bgmPlayer = [AMETools getMP3PlayerWithFileName:@"bgm_lose" RuntimeCount:1];
                [_bgmPlayer play];
            }
            
            if (_mainPlayer.seOpen) {
                _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_lose_%d",arc4random()%VOICE_LOSE_COUNT] RuntimeCount:1];
                [_voicePlayer2 play];
            }
            
            [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) next:^{
                AMELabel * notice = [AMETools createAMELabelWithText:@"战败了哦,提升属性后再来挑战吧!" strokeWidth:2.0 size:20];
                notice.frame = CGRectMake(0, 80*Y_P, _noticeBox.frame.size.width, 50*Y_P);
                notice.textAlignment = NSTextAlignmentCenter;
                [_noticeBox addSubview:notice];
                
                AMELevelButton * done_btn = [[AMELevelButton alloc]init];
                [done_btn setImage:[UIImage imageNamed:@"done_btn"] forState:UIControlStateNormal];
                done_btn.frame = CGRectMake(120*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
                done_btn.tag = 9002;
                [done_btn addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
                [_noticeBox addSubview:done_btn];
            }];

        }
    }
}


#pragma mark 敌人死亡与游戏结束
- (void)checkEnemyDie{
    NSMutableArray * temp = [NSMutableArray arrayWithCapacity:0];
    for (AMEEnemyButton * btn in _enemyArray) {
        if (btn.info.nowLife<=0) {
            [self enemyDie:btn];
            [temp addObject:btn];
            //判定船的类型
            if (btn.info.shipType == en_destroyer) {
                _destroyerCount--;
            }else if (btn.info.shipType == en_cruiser){
                _cruiserCount--;
            }else if (btn.info.shipType == en_quzhuqiji){
                _isQuzhuqiji = NO;
            }else if (btn.info.shipType == en_qingxunqigui){
                _isQingxunqigui = NO;
            }else if (btn.info.shipType == en_zhanjianqiji){
                _isZhanjianqiji = NO;
            }else if (btn.info.shipType == en_kongmuqiji){
                _isKongmuqiji = NO;
            }else if (btn.info.shipType == en_gangwanqiji){
                _isGangwanqiji = NO;
            }else if (btn.info.shipType == en_zhongjianqiji){
                _isZhongjianqiji = NO;
            }else if (btn.info.shipType == en_beifangqiji){
                _isBeifangqiji = NO;
                _beifangDieTime = _timerRunningTime;
            }
        }
    }
    for (AMEEnemyButton * btn in temp) {
        [_enemyArray removeObject:btn];
    }
    temp=nil;
    if (_enemyArray.count==0||(_enemyArray.count==1&&_isGangwanqiji)) {
        NSLog(@"游戏结束");//测试成功
        [self stopTimer];
        if (_endArray&&_endArray.count) {
            [self moveUIOutWithAnimation:YES btnAble:NO next:^{
                [self createDialogUI];
            }];
        }else{
            [self createResult];
        }

    }
}

- (void)createResult{
    
    [_focusView removeFromSuperview];
    
    if (_mainPlayer.bgmOpen) {
        [_bgmPlayer stop];
    }
    //胜利音乐
    if (_mainPlayer.bgmOpen) {
        _bgmPlayer = [AMETools getMP3PlayerWithFileName:@"bgm_win" RuntimeCount:1];
        [_bgmPlayer play];
    }
    
    if (_mainPlayer.seOpen) {
        _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_win_%d",arc4random()%VOICE_WIN_COUNT] RuntimeCount:1];
        [_voicePlayer2 play];
    }
    [self createNoticeBoxWithImage:[UIImage imageNamed:@"option_box"] rect:CGRectMake(0, 100*Y_P, WIDTH, 350*Y_P) next:^{
        //标题
        AMELabel * optionMain_lbl = [AMETools createAMELabelWithText:@"过关" strokeWidth:3.0 size:25.0];
        optionMain_lbl.frame = CGRectMake(0, 0, WIDTH, 25*Y_P);
        optionMain_lbl.alpha = 0.8;
        optionMain_lbl.textAlignment = NSTextAlignmentCenter;
        [_noticeBox addSubview:optionMain_lbl];
        
        AMELabel * statistics = [AMETools createAMELabelWithText:@"技术统计" strokeWidth:2.0 size:18.0];
        statistics.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2, 100, 30);
        statistics.alpha = 0.8;
        [_noticeBox addSubview:statistics];
        
        AMELabel * count = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"零:%03lu  壹:%03lu  贰:%03lu  叁:%03lu  肆:%03lu\n伍:%03lu  陆:%03lu  柒:%03lu",_att_0_count,_att_1_count,_att_2_count,_att_3_count,_att_4_count,_att_5_count,_att_6_count,_att_7_count] strokeWidth:2.0 size:18.0];
        count.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+22*Y_P, WIDTH, 50);
        count.numberOfLines = 2;
        count.alpha = 0.8;
        [_noticeBox addSubview:count];
        float all = (float)(_att_0_count+_att_1_count+_att_2_count+_att_3_count+_att_4_count+_att_5_count+_att_6_count+_att_7_count);
        //防止玩家只使用道具 导致总和为0 程序崩溃
        if (all==0) {
            all = 1.0;
        }
        
        float avg = (float)(_att_1_count*1+_att_2_count*2+_att_3_count*3+_att_4_count*4+_att_5_count*5+_att_6_count*6+_att_7_count*7)/all;
        AMELabel * att_avg = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"平均相同点:%.2f",avg] strokeWidth:2.0 size:18];
        att_avg.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+65*Y_P, WIDTH, 50);
        att_avg.alpha = 0.8;
        [_noticeBox addSubview:att_avg];
        
        AMELabel * life = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"剩余血量:%.2f%%",_playerLifeNow] strokeWidth:2.0 size:18];
        life.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+85*Y_P, WIDTH, 50);
        life.alpha = 0.8;
        [_noticeBox addSubview:life];
        
        //防止avg为0时没有奖励
        if (avg==0) {
            avg = 1.0;
        }
        
        BOOL isFull = NO;
        AMELabel * reward = [AMETools createAMELabelWithText:@"奖励统计" strokeWidth:2.0 size:18.0];
        reward.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+120*Y_P, 100, 30);
        reward.alpha = 0.8;
        [_noticeBox addSubview:reward];
        
        UIImageView * fuel = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+140*Y_P, 17*X_P, 17*Y_P)];
        fuel.image = [UIImage imageNamed:@"s_fuel"];
        [_noticeBox addSubview:fuel];
        
        NSUInteger fuel_reward = BASIC_FUEL*avg;
        if (_mainPlayer.nowLevel>=self.level) {
            fuel_reward = fuel_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+5){
            fuel_reward = fuel_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+10){
            fuel_reward = fuel_reward/2.5;
        }
        AMELabel * re_fuel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",fuel_reward] strokeWidth:2.0 size:18.0];
        if (fuel_reward+_mainPlayer.s_fuelNum>999) {
            re_fuel.text = [NSString stringWithFormat:@"%lu",999-_mainPlayer.s_fuelNum];
            re_fuel.fillColor = TEXT_RED;
            isFull = YES;
        }
        re_fuel.frame = CGRectMake(WIDTH*0.12+20*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 100, 30);
        re_fuel.alpha = 0.8;
        [_noticeBox addSubview:re_fuel];
        
        UIImageView * ammunition = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.12+60*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 17*X_P, 17*Y_P)];
        ammunition.image = [UIImage imageNamed:@"s_ammunition"];
        [_noticeBox addSubview:ammunition];
        
        NSUInteger ammunition_reward = (BASIC_REWARD*1.5)*avg;
        if (_mainPlayer.nowLevel>=self.level) {
            ammunition_reward = ammunition_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+5){
            ammunition_reward = ammunition_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+10){
            ammunition_reward = ammunition_reward/2.5;
        }
        AMELabel * re_ammunition = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",ammunition_reward] strokeWidth:2.0 size:18.0];
        if (ammunition_reward+_mainPlayer.s_ammunitionNum>999) {
            re_ammunition.text = [NSString stringWithFormat:@"%lu",999-_mainPlayer.s_ammunitionNum];
            re_ammunition.fillColor = TEXT_RED;
            isFull = YES;
        }
        re_ammunition.frame = CGRectMake(WIDTH*0.12+80*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 100, 30);
        re_ammunition.alpha = 0.8;
        [_noticeBox addSubview:re_ammunition];
        
        UIImageView * steel = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.12+120*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 17*X_P, 17*Y_P)];
        steel.image = [UIImage imageNamed:@"s_steel"];
        [_noticeBox addSubview:steel];
        
        NSUInteger steel_reward = BASIC_REWARD*avg;
        if (_mainPlayer.nowLevel>=self.level) {
            steel_reward = steel_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+5){
            steel_reward = steel_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+10){
            steel_reward = steel_reward/2.5;
        }
        AMELabel * re_steel = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",steel_reward] strokeWidth:2.0 size:18.0];
        if (steel_reward+_mainPlayer.s_steelNum>999) {
            re_steel.text = [NSString stringWithFormat:@"%lu",999-_mainPlayer.s_steelNum];
            re_steel.fillColor = TEXT_RED;
            isFull = YES;
        }
        re_steel.frame = CGRectMake(WIDTH*0.12+140*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 100, 30);
        re_steel.alpha = 0.8;
        [_noticeBox addSubview:re_steel];
        
        
        UIImageView * aluminium = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.12+180*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 17*X_P, 17*Y_P)];
        aluminium.image = [UIImage imageNamed:@"s_aluminium"];
        [_noticeBox addSubview:aluminium];
        
        NSUInteger aluminium_reward = BASIC_REWARD*avg;
        if (_mainPlayer.nowLevel>=self.level) {
            aluminium_reward = aluminium_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+5){
            aluminium_reward = aluminium_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+10){
            aluminium_reward = aluminium_reward/2.5;
        }
        AMELabel * re_aluminium = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",aluminium_reward] strokeWidth:2.0 size:18.0];
        if (aluminium_reward+_mainPlayer.s_aluminiumNum>999) {
            re_aluminium.text = [NSString stringWithFormat:@"%lu",999-_mainPlayer.s_aluminiumNum];
            re_aluminium.fillColor = TEXT_RED;
            isFull = YES;
        }
        re_aluminium.frame = CGRectMake(WIDTH*0.12+200*X_P, _noticeBox.frame.size.height*0.2+140*Y_P, 100, 30);
        re_aluminium.alpha = 0.8;
        [_noticeBox addSubview:re_aluminium];
        
        
        UIImageView * coin = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+160*Y_P, 17*X_P, 17*Y_P)];
        coin.image = [UIImage imageNamed:@"coin"];
        [_noticeBox addSubview:coin];
        
        NSUInteger coin_reward = COIN_REWARD*avg;
        if (_mainPlayer.nowLevel>=self.level) {
            coin_reward = coin_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+5){
            coin_reward = coin_reward/2;
        }
        if (_mainPlayer.nowLevel>=self.level+10){
            coin_reward = coin_reward/2.5;
        }
        AMELabel * re_coin = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",coin_reward] strokeWidth:2.0 size:18.0];
        re_coin.frame = CGRectMake(WIDTH*0.12+20*X_P, _noticeBox.frame.size.height*0.2+160*Y_P, 200, 30);
        re_coin.alpha = 0.8;
        [_noticeBox addSubview:re_coin];
        
        if (isFull) {
            AMELabel * full = [AMETools createAMELabelWithText:@"有资源超过仓库上限,请尽快处理!" strokeWidth:2.0 size:18.0];
            full.frame = CGRectMake(WIDTH*0.12, _noticeBox.frame.size.height*0.2+180*Y_P, 300, 30);
            full.alpha = 0.8;
            [_noticeBox addSubview:full];
        }
        
        UIButton * done = [AMETools createDoneButtonWithAble:YES];
        done.frame = CGRectMake(0, 0, 80*X_P, 35*Y_P);
        done.center = CGPointMake(_noticeBox.center.x, _noticeBox.frame.origin.y+_noticeBox.frame.size.height-150*Y_P);
        done.tag = 9002;
        [done addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_noticeBox addSubview:done];
        
        _mainPlayer.s_fuelNum += fuel_reward;
        _mainPlayer.s_ammunitionNum += ammunition_reward;
        _mainPlayer.s_steelNum += steel_reward;
        _mainPlayer.s_aluminiumNum += aluminium_reward;
        _mainPlayer.coinNum += coin_reward;
        
        if (_mainPlayer.nowLevel<self.level) {
            _mainPlayer.nowLevel = self.level;
        }
        
        [self playerToSave:_save];
        [_save saveWithIndex:[[[NSUserDefaults standardUserDefaults]objectForKey:@"lastSave"] integerValue]];
    }];
}


- (void)enemyDie:(AMEEnemyButton *)btn{
    btn.enabled = NO;
    if (btn.isFocus) {
        [self changeFocusView];
        btn.isFocus = NO;
    }
    [UIView animateWithDuration:2.0 animations:^{
        btn.alpha = 0;
        btn.infoLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
        AMEImage * leakEffect = [[AMEImage alloc]initWithFrame:CGRectMake(0,0,50,50)];
        leakEffect.center = btn.center;
        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:4];
        for (int i=0; i<4; i++) {
            arr[i] = [UIImage imageNamed:[NSString stringWithFormat:@"e_leak_%d",i]];
        }
        leakEffect.animationImages = arr;
        leakEffect.animationduration = 1.0;
        leakEffect.animationRepeatCount = 3;
        [self.view addSubview:leakEffect];
        [leakEffect startAnimation];
    }];
}

#pragma mark 敌军轰炸计时
- (void)checkEnemyAircraft{
    for (AMEEnemyButton * btn in _enemyArray) {
        //运行时间不等于随机启动时间,且可以被时间间隔整除时等于启动时间,而且是航母
        if (_isBeifangqiji&&_timerRunningTime%(NSUInteger)(self.aircraftInterval*(1-0.3))==btn.info.startTime&&_timerRunningTime!=btn.info.startTime&&(btn.info.shipType==aircraftCarrier||btn.info.shipType==en_kongmuqiji||btn.info.shipType==en_beifangqiji)) {
            [self createEnemyAircraft];
        }
        //北方死了以后,重新计时
        if (!_isBeifangqiji&&_timerRunningTime%self.aircraftInterval==_beifangDieTime%self.aircraftInterval+btn.info.startTime&&_timerRunningTime!=_beifangDieTime+btn.info.startTime&&(btn.info.shipType==aircraftCarrier||btn.info.shipType==en_kongmuqiji)) {
            [self createEnemyAircraft];
        }
    }
}



#pragma mark 敌军鱼雷计时
- (void)checkEnemyTorpedo{
    if (_timerRunningTime&&_timerRunningTime%(self.torpedoInterval)==0) {
        for (AMEEnemyButton * btn in _enemyArray) {
            if (btn.info.shipType==en_destroyer) {
                if (arc4random()%5==0) {
                    [self createEnemyTorpedoFromEnemyBtn:btn];
                }
            }
                //轻巡栖鬼10%概率发射鱼雷
            if (btn.info.shipType==en_qingxunqigui){
                if (arc4random()%10==0) {
                    [self createEnemyTorpedoFromEnemyBtn:btn];
                }
            }if (btn.info.shipType==en_quzhuqiji) {
                //驱逐栖姬40%概率发射鱼雷
                if (arc4random()%5<2) {
                    [self createEnemyTorpedoFromEnemyBtn:btn];
                }
            }
        }
    }
}


#pragma mark 我军炮弹
- (void)createBulletToEnemyBtn:(AMEEnemyButton *)btn count:(NSUInteger)count{
    NSUInteger desX = arc4random()%((NSUInteger)WIDTH-140)+70;
    NSUInteger desY = arc4random()%90+365*Y_P;
    UIImageView * bullet1;
    UIImageView * bullet2;
    UIImageView * bullet3;
    if (count<=3&&count>0) {
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet1.center = CGPointMake(desX, desY);
        bullet1 = [AMETools makeRotation:bullet1 speedX:btn.center.x-desX speedY:btn.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet1];
    }else if (count<=5&&count>3){
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet1.center = CGPointMake(desX-20*X_P, desY);
        bullet1 = [AMETools makeRotation:bullet1 speedX:btn.center.x-desX-20*X_P speedY:btn.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet1];
        
        bullet2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet2.center = CGPointMake(desX+20*X_P, desY);
        bullet2 = [AMETools makeRotation:bullet2 speedX:btn.center.x-desX+20*X_P speedY:btn.center.y-desY];
        bullet2.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet2];
    }else if (count<=7&&count>5){
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet1.center = CGPointMake(desX-20*X_P, desY);
        bullet1 = [AMETools makeRotation:bullet1 speedX:btn.center.x-desX-20*X_P speedY:btn.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet1];
        
        bullet2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet2.center = CGPointMake(desX+20*X_P, desY);
        bullet2 = [AMETools makeRotation:bullet2 speedX:btn.center.x-desX+20*X_P speedY:btn.center.y-desY];
        bullet2.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet2];
        
        bullet3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        bullet3.center = CGPointMake(desX, desY);
        bullet3 = [AMETools makeRotation:bullet3 speedX:btn.center.x-desX speedY:btn.center.y-desY];
        bullet3.image = [UIImage imageNamed:@"bullet"];
        [self.view addSubview:bullet3];
    }
    [UIView animateWithDuration:1.0 animations:^{
        if (count<=3&&count>0) {
            bullet1.center = CGPointMake(btn.center.x, btn.center.y+20*Y_P);
        }else if(count<=5&&count>3){
            bullet1.center = CGPointMake(btn.center.x-20*X_P, btn.center.y+20*Y_P);
            bullet2.center = CGPointMake(btn.center.x+20*X_P, btn.center.y+20*Y_P);
        }else if (count<=7&&count>5){
            bullet1.center = CGPointMake(btn.center.x-20*X_P, btn.center.y+20*Y_P);
            bullet2.center = CGPointMake(btn.center.x+20*X_P, btn.center.y+20*Y_P);
            bullet3.center = CGPointMake(btn.center.x, btn.center.y+20*Y_P);
        }
    } completion:^(BOOL finished) {
        [bullet1 removeFromSuperview];
        if (bullet2) {
            [bullet2 removeFromSuperview];
        }
        if (bullet3) {
            [bullet3 removeFromSuperview];
        }
        if (count<=3&&count>0) {
            //和轰炸用一个爆炸效果
            AMEImage * bullet_boom = [self createAircraftBoom];
            bullet_boom.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom.center = CGPointMake(btn.center.x, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom];
            [bullet_boom startAnimation];
        }else if(count<=5&&count>3){
            AMEImage * bullet_boom1 = [self createAircraftBoom];
            bullet_boom1.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom1.center = CGPointMake(btn.center.x-20*X_P, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom1];
            [bullet_boom1 startAnimation];
            
            AMEImage * bullet_boom2 = [self createAircraftBoom];
            bullet_boom2.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom2.center = CGPointMake(btn.center.x+20*X_P, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom2];
            [bullet_boom2 startAnimation];
        }else if(count<=7&&count>5){
            AMEImage * bullet_boom1 = [self createAircraftBoom];
            bullet_boom1.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom1.center = CGPointMake(btn.center.x-20*X_P, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom1];
            [bullet_boom1 startAnimation];
            
            AMEImage * bullet_boom2 = [self createAircraftBoom];
            bullet_boom2.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom2.center = CGPointMake(btn.center.x+20*X_P, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom2];
            [bullet_boom2 startAnimation];
            
            AMEImage * bullet_boom3 = [self createAircraftBoom];
            bullet_boom3.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom3.center = CGPointMake(btn.center.x, btn.center.y+20*Y_P);
            [self.view addSubview:bullet_boom3];
            [bullet_boom3 startAnimation];
        }
        if (count&&_mainPlayer.seOpen) {
            _playerFirePlayer = [AMETools getWAVPlayerWithFileName:@"se_boom" RuntimeCount:1];
            [_playerFirePlayer play];
        }
        NSUInteger damage = count*PLAYER_BASIC_DAMAGE*(1+_mainPlayer.lv_fire*0.07);
        BOOL damageYellow = NO;
        if (btn.info.shipType!=en_destroyer) {
            damage = damage*(1-_destroyerCount*0.2);
            if (damage<count*PLAYER_BASIC_DAMAGE*(1+self.level*0.1)*0.4) {
                damage=count*PLAYER_BASIC_DAMAGE*(1+self.level*0.1)*0.4;
            }
            if (_destroyerCount>0) {
                damageYellow = YES;
            }
        }
        if (_isGangwanqiji) {
            damage = damage*0.85;
            damageYellow = YES;
        }
        [self enemyDamaged:damage enemyBtn:btn yellow:damageYellow];
    }];


}

#pragma mark 敌军发射炮弹
- (void)checkBullet{
    for (AMEEnemyButton * btn in _enemyArray) {
        //这里尤其注意符号优先级
        if (btn.info.shipType!=aircraftCarrier&&btn.info.shipType!=en_kongmuqiji&&_timerRunningTime%btn.info.FireInterval==btn.info.startTime) {
            [self createEnemyBulletFromEnemyBtn:btn];
        }
    }
}

#pragma mark 敌军炮弹
- (void)createEnemyBulletFromEnemyBtn:(AMEEnemyButton *)btn{
    NSUInteger desX = arc4random()%((NSUInteger)WIDTH-140)+70;
    NSUInteger desY = arc4random()%90+365*Y_P;
    UIImageView * bullet1;
    UIImageView * bullet2;
    UIImageView * bullet3;
    if (btn.info.shipType==destroyer) {
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point = btn.center;
        bullet1.center = CGPointMake(point.x, point.y+30*Y_P);
        bullet1 = [AMETools makeRotation:bullet1 speedX:bullet1.center.x-desX speedY:bullet1.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet1];
        
        if (_mainPlayer.seOpen) {
            _enemyFirePlayer = [AMETools getMP3PlayerWithFileName:@"se_fire" RuntimeCount:1];
            _enemyFirePlayer.volume = 0.3;
            [_enemyFirePlayer play];
        }
        
    }else if (btn.info.shipType==cruiser){
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point1 = CGPointMake(btn.center.x-20*X_P, btn.center.y);
        bullet1.center = CGPointMake(point1.x, point1.y+30*Y_P);
        bullet1 = [AMETools makeRotation:bullet1 speedX:bullet1.center.x-desX-20*X_P speedY:bullet1.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet1];
        
        bullet2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point2 = CGPointMake(btn.center.x+20*X_P, btn.center.y);
        bullet2.center = CGPointMake(point2.x, point2.y+30*Y_P);
        bullet2 = [AMETools makeRotation:bullet2 speedX:bullet2.center.x-desX+20*X_P speedY:bullet2.center.y-desY];
        bullet2.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet2];
        
        if (_mainPlayer.seOpen) {
            _enemyFirePlayer = [AMETools getMP3PlayerWithFileName:@"se_fire" RuntimeCount:1];
            _enemyFirePlayer.volume = 0.4;
            [_enemyFirePlayer play];
        }
        
    }else if (btn.info.shipType==battleship||btn.info.shipType==en_quzhuqiji||btn.info.shipType==en_qingxunqigui||btn.info.shipType==en_zhanjianqiji||btn.info.shipType==en_gangwanqiji||btn.info.shipType==en_zhongjianqiji||btn.info.shipType==en_beifangqiji){
        bullet1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point1 = CGPointMake(btn.center.x-20*X_P, btn.center.y);
        bullet1.center = CGPointMake(point1.x, point1.y+30*Y_P);
        bullet1 = [AMETools makeRotation:bullet1 speedX:bullet1.center.x-desX-20*X_P speedY:bullet1.center.y-desY];
        bullet1.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet1];
        
        bullet2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point2 = CGPointMake(btn.center.x+20*X_P, btn.center.y);
        bullet2.center = CGPointMake(point2.x, point2.y+30*Y_P);
        bullet2 = [AMETools makeRotation:bullet2 speedX:bullet2.center.x-desX+20*X_P speedY:bullet2.center.y-desY];
        bullet2.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet2];
        
        bullet3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 3*X_P, 10*Y_P)];
        CGPoint point3 = btn.center;
        bullet3.center = CGPointMake(point3.x, point3.y+30*Y_P);
        bullet3 = [AMETools makeRotation:bullet3 speedX:bullet3.center.x-desX speedY:bullet3.center.y-desY];
        bullet3.image = [UIImage imageNamed:@"en_bullet"];
        [self.view addSubview:bullet3];
        
        if (_mainPlayer.seOpen) {
            _enemyFirePlayer = [AMETools getMP3PlayerWithFileName:@"se_fire" RuntimeCount:1];
            _enemyFirePlayer.volume = 0.5;
            [_enemyFirePlayer play];
        }
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        if (btn.info.shipType==destroyer) {
            bullet1.center = CGPointMake(desX, desY);
        }else if(btn.info.shipType==cruiser){
            bullet1.center = CGPointMake(desX-20*X_P, desY);
            bullet2.center = CGPointMake(desX+20*X_P, desY);
        }else if(btn.info.shipType==battleship||btn.info.shipType==en_quzhuqiji||btn.info.shipType==en_qingxunqigui||btn.info.shipType==en_zhanjianqiji||btn.info.shipType==en_gangwanqiji||btn.info.shipType==en_zhongjianqiji||btn.info.shipType==en_beifangqiji){
            bullet1.center = CGPointMake(desX-20*X_P, desY);
            bullet2.center = CGPointMake(desX+20*X_P, desY);
            bullet3.center = CGPointMake(desX, desY);
        }
    }completion:^(BOOL finished) {
        [bullet1 removeFromSuperview];
        if (bullet2) {
            [bullet2 removeFromSuperview];
        }
        if (bullet3) {
            [bullet3 removeFromSuperview];
        }
        if (btn.info.shipType==destroyer) {
            
            if (_mainPlayer.seOpen) {
                _enemyFireBoomPlayer = [AMETools getWAVPlayerWithFileName:@"se_boom" RuntimeCount:1];
                _enemyFireBoomPlayer.volume = 0.6;
                [_enemyFireBoomPlayer play];
            }
            
            //和轰炸用一个爆炸效果
            AMEImage * bullet_boom = [self createAircraftBoom];
            bullet_boom.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom.center = CGPointMake(desX, desY);
            [self.view addSubview:bullet_boom];
            [bullet_boom startAnimation];
        }else if(btn.info.shipType==cruiser){
            
            if (_mainPlayer.seOpen) {
                _enemyFireBoomPlayer = [AMETools getWAVPlayerWithFileName:@"se_boom" RuntimeCount:1];
                _enemyFireBoomPlayer.volume = 0.7;
                [_enemyFireBoomPlayer play];
            }
            
            AMEImage * bullet_boom1 = [self createAircraftBoom];
            bullet_boom1.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom1.center = CGPointMake(desX-20*X_P, desY);
            [self.view addSubview:bullet_boom1];
            [bullet_boom1 startAnimation];
            
            AMEImage * bullet_boom2 = [self createAircraftBoom];
            bullet_boom2.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom2.center = CGPointMake(desX+20*X_P, desY);
            [self.view addSubview:bullet_boom2];
            [bullet_boom2 startAnimation];
        }else if(btn.info.shipType==battleship||btn.info.shipType==en_quzhuqiji||btn.info.shipType==en_qingxunqigui||btn.info.shipType==en_zhanjianqiji||btn.info.shipType==en_gangwanqiji||btn.info.shipType==en_zhongjianqiji||btn.info.shipType==en_beifangqiji){
            
            if (_mainPlayer.seOpen) {
                _enemyFireBoomPlayer = [AMETools getWAVPlayerWithFileName:@"se_boom" RuntimeCount:1];
                _enemyFireBoomPlayer.volume = 0.8;
                [_enemyFireBoomPlayer play];
            }
            
            AMEImage * bullet_boom1 = [self createAircraftBoom];
            bullet_boom1.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom1.center = CGPointMake(desX-20*X_P, desY);
            [self.view addSubview:bullet_boom1];
            [bullet_boom1 startAnimation];
            
            AMEImage * bullet_boom2 = [self createAircraftBoom];
            bullet_boom2.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom2.center = CGPointMake(desX+20*X_P, desY);
            [self.view addSubview:bullet_boom2];
            [bullet_boom2 startAnimation];
            
            AMEImage * bullet_boom3 = [self createAircraftBoom];
            bullet_boom3.frame = CGRectMake(0, 0, 15, 15);
            bullet_boom3.center = CGPointMake(desX, desY);
            [self.view addSubview:bullet_boom3];
            [bullet_boom3 startAnimation];
        }
        float damage = btn.info.damage;
        BOOL Intensive = NO;
        
        if ((_isQuzhuqiji&&btn.info.shipType==en_destroyer)||btn.info.shipType==en_quzhuqiji) {
            damage *= 1.2;
            Intensive = YES;
        }
        if ((_isQingxunqigui&&btn.info.shipType==en_cruiser)||btn.info.shipType==en_qingxunqigui) {
            damage *= 1.3;
            Intensive = YES;
        }
        if (_isZhanjianqiji) {
            damage *= 1.1;
            Intensive = YES;
        }
        if (Intensive) {
            [self playerLifeDownAndDieCheckWithDamage:damage colorType:playerLifeDownTypeIntensive];
        }else{
            [self playerLifeDownAndDieCheckWithDamage:damage colorType:playerLifeDownTypeNormal];
        }
    }];
}


#pragma mark 获取焦点敌军
- (AMEEnemyButton *)getFocusEnemy{
    for (AMEEnemyButton * btn in _enemyArray) {
        if (btn.isFocus) {
            return btn;
        }
    }
    return nil;
}

#pragma mark 敌军鱼雷
- (void)createEnemyTorpedoFromEnemyBtn:(AMEEnemyButton *)btn{
    if (_mainPlayer.seOpen) {
        _torpedoPlayer = [AMETools getMP3PlayerWithFileName:@"se_torpedo" RuntimeCount:1];
        _torpedoPlayer.volume = 0.6;
        [_torpedoPlayer play];
    }
    
    //找个提示危险的语音放这
    
    if (_mainPlayer.seOpen) {
        _torpedoComing = [AMETools getMP3PlayerWithFileName:@"se_torpedo_coming" RuntimeCount:1];
        _torpedoComing.currentTime = 1.5;
        [_torpedoComing play];
    }
    
    NSUInteger des = arc4random()%((NSUInteger)WIDTH-140)+70;
    UIImageView * torpedo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5*X_P, 25*Y_P)];
    CGPoint point = btn.center;
    torpedo.center = CGPointMake(point.x, point.y+40*Y_P);
    torpedo = [AMETools makeRotation:torpedo speedX:torpedo.center.x-des speedY:torpedo.center.y-365*Y_P];
    torpedo.alpha = 0.6;
    torpedo.image = [UIImage imageNamed:@"en_torpedo"];
    [self.view addSubview:torpedo];
    
    
    
    [UIView animateWithDuration:5.0 animations:^{
        torpedo.center = CGPointMake(des, 365*Y_P);
    }completion:^(BOOL finished) {
        [torpedo removeFromSuperview];
        
        if (_mainPlayer.seOpen) {
            _torpedoPlayer = [AMETools getWAVPlayerWithFileName:@"se_torpedo_boom" RuntimeCount:1];
            [_torpedoPlayer play];
        }
        
        AMEImage * torpedo_boom = [self createTorpedoBoom];
        torpedo_boom.center = CGPointMake(des, 365*Y_P);
        [self playerLifeDownAndDieCheckWithDamage:20.0 colorType:playerLifeDownTypeNormal];
        //100%漏水
        [self startLeakEffect];
        [self.view addSubview:torpedo_boom];
        [torpedo_boom startAnimation];
    }];
}

#pragma mark 敌军掉血
- (void)enemyDamaged:(NSInteger)damage enemyBtn:(AMEEnemyButton *)btn yellow:(BOOL)isYellow{
    btn.info.nowLife -= damage;
    [btn updateInfoLabelText];
    [self checkEnemyDie];
    AMELabel * effect;
    //中间栖姬的奶...
    if (damage<0) {
        effect = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"+%lu",-damage] strokeWidth:2.0 size:15];
        effect.fillColor = TEXT_GREEN;
    }else{
        effect = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"-%lu",damage] strokeWidth:2.0 size:15];
    }
    effect.alpha = 0;
    if (isYellow) {
        effect.fillColor = [UIColor colorWithRed:1.0 green:245/255.0 blue:90/255.0 alpha:1.0];
    }
    effect.frame = CGRectMake(btn.frame.origin.x,btn.frame.origin.y+btn.frame.size.height+30*Y_P , btn.frame.size.width, 20*Y_P);
    effect.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:effect];
    [UIView animateWithDuration:1.0 animations:^{
        effect.alpha = 1;
        effect.center = CGPointMake(effect.center.x, effect.center.y+15*Y_P);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            effect.alpha = 0;
            effect.center = CGPointMake(effect.center.x, effect.center.y+15*Y_P);
        } completion:^(BOOL finished) {
            [effect removeFromSuperview];
        }];
    }];
}


#pragma mark 随机切换focusView
- (void)changeFocusView{
    if (_enemyArray.count>1) {
        NSUInteger index;
        while (1) {
            index = arc4random()%_enemyArray.count;
            AMEEnemyButton * btn = _enemyArray[index];
            if (btn.enabled) {
                break;
            }
        }
        AMEEnemyButton * btn = _enemyArray[index];
        btn.isFocus = YES;
        _focusView.frame = CGRectMake(0, 0, btn.frame.size.width+50*X_P, 35*Y_P);
        _focusView.center = CGPointMake(btn.center.x, btn.center.y+btn.frame.size.height*0.2);
    }else if (_enemyArray.count==1){
        AMEEnemyButton * btn = _enemyArray[0];
        if (btn.enabled == YES) {
            btn.isFocus = YES;
            _focusView.frame = CGRectMake(0, 0, btn.frame.size.width+50*X_P, 35*Y_P);
            _focusView.center = CGPointMake(btn.center.x, btn.center.y+btn.frame.size.height*0.2);
        }
    }else if (_enemyArray.count==0){
        [_focusView removeFromSuperview];
    }
}


#pragma mark 创建focusView
- (void)createFocusView{
    _focusView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"focus"]];
    _focusView.frame = CGRectMake(0, 0, 30*X_P, 30*X_P);
    _focusView.alpha = 0.6;
    [self.view addSubview:_focusView];
    //初始随机锁定一个
    [self changeFocusView];
}

#pragma mark focus切换
- (void)focusChange:(AMEEnemyButton *)btn{
    for (AMEEnemyButton * temp in _enemyArray) {
        if (temp.isFocus) {
            temp.isFocus = NO;
        }
        btn.isFocus = YES;
        _focusView.frame = CGRectMake(0, 0, btn.frame.size.width+50*X_P, 35*Y_P);
        _focusView.center = CGPointMake(btn.center.x, btn.center.y+btn.frame.size.height*0.2);
    }
}


#pragma mark 生成敌军飞机的方法
- (void)createEnemyAircraft{
    if (_mainPlayer.seOpen) {
        _enemyAircraftPlayer = [AMETools getMP3PlayerWithFileName:@"se_aircraft" RuntimeCount:0];
        [_enemyAircraftPlayer play];
    }
    
    UIImageView * aircraft1;
    UIImageView * aircraft2;
    UIImageView * aircraft3;
    AMEImage * boom1 = [self createAircraftBoom];
    AMEImage * boom2 = [self createAircraftBoom];
    AMEImage * boom3 = [self createAircraftBoom];
    [self.view addSubview:boom1];
    [self.view addSubview:boom2];
    [self.view addSubview:boom3];
    NSUInteger des = arc4random()%2;
    if (des) {
        aircraft1 = [[UIImageView alloc]initWithFrame:CGRectMake(-80+25*X_P, 100*Y_P, 30*X_P, 30*Y_P)];
        aircraft1.image = [UIImage imageNamed:@"en_aircraft_left"];
    
        aircraft2 = [[UIImageView alloc]initWithFrame:CGRectMake(-80+50*X_P, 80*Y_P, 30*X_P, 30*Y_P)];
        aircraft2.image = [UIImage imageNamed:@"en_aircraft_left"];
        
        aircraft3 = [[UIImageView alloc]initWithFrame:CGRectMake(-80, 120*Y_P, 30*X_P, 30*Y_P)];
        aircraft3.image = [UIImage imageNamed:@"en_aircraft_left"];
        boom1.center = CGPointMake(300*X_P, 365*Y_P);
        boom2.center = CGPointMake(300*X_P+15*X_P, 365*Y_P-10*Y_P);
        boom3.center = CGPointMake(300*X_P-15*X_P, 365*Y_P+10*Y_P);
    }else{
        aircraft1 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80+25*X_P, 100*Y_P, 30*X_P, 30*Y_P)];
        aircraft1.image = [UIImage imageNamed:@"en_aircraft_right"];
        
        aircraft2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80+50*X_P, 120*Y_P, 30*X_P, 30*Y_P)];
        aircraft2.image = [UIImage imageNamed:@"en_aircraft_right"];
        
        aircraft3 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80, 80*Y_P, 30*X_P, 30*Y_P)];
        aircraft3.image = [UIImage imageNamed:@"en_aircraft_right"];
        boom1.center = CGPointMake(80*X_P, 365*Y_P);
        boom2.center = CGPointMake(80*X_P+15*X_P, 365*Y_P+10*Y_P);
        boom3.center = CGPointMake(80*X_P-15*X_P, 365*Y_P-10*Y_P);
    }
    [self.view addSubview:aircraft1];
    [self.view addSubview:aircraft2];
    [self.view addSubview:aircraft3];
    [UIView animateWithDuration:3.5 animations:^{
        if (des) {
            aircraft1.center = CGPointMake(300*X_P, 365*Y_P);
            aircraft2.center = CGPointMake(300*X_P+25*X_P, 365*Y_P-20*Y_P);
            aircraft3.center = CGPointMake(300*X_P-25*X_P, 365*Y_P+20*Y_P);
        }else{
            aircraft1.center = CGPointMake(80*X_P, 365*Y_P);
            aircraft2.center = CGPointMake(80*X_P+25*X_P, 365*Y_P+20*Y_P);
            aircraft3.center = CGPointMake(80*X_P-25*X_P, 365*Y_P-20*Y_P);
        }
    } completion:^(BOOL finished) {
        
        if (_mainPlayer.seOpen) {
            _aircraftBoomPlayer = [AMETools getWAVPlayerWithFileName:@"se_aircraft_boom" RuntimeCount:1];
            _aircraftBoomPlayer.volume = 0.8;
            [_aircraftBoomPlayer play];
        }
        
        [boom1 startAnimation];
        [boom2 startAnimation];
        [boom3 startAnimation];
        //减血 50%概率起火
        
        float damage;
        BOOL isIntensive = NO;
        damage = ENEMY_AIRCRAFT_DAMAGE*(1+0.05*self.level-_mainPlayer.lv_antiaircraft*0.025);
        //空母栖姬存在 伤害提高10%
        if (_isKongmuqiji) {
            damage *= 1.1;
            isIntensive = YES;
        }
        if (damage<=0) {
            damage = 0.01;
        }
        
        //判断是否加强 ,加强则显示绿色
        if (isIntensive) {
            [self playerLifeDownAndDieCheckWithDamage:damage colorType:playerLifeDownTypeIntensive];
        }else{
            [self playerLifeDownAndDieCheckWithDamage:damage colorType:playerLifeDownTypeNormal];
        }
        
        
        //起火率
        if (_isKongmuqiji) {
            //空母栖姬存在,起火率+25%
            if (arc4random()%4<3) {
                [self startFireEffect];
            }
        }else{
            if (arc4random()%2) {
                [self startFireEffect];
            }
        }
        
        [UIView animateWithDuration:2.0 animations:^{
            if (des) {
                aircraft1.center = CGPointMake(WIDTH+80+300*X_P, 455*Y_P);
                aircraft2.center = CGPointMake(WIDTH+80+300*X_P+25*X_P, 455*Y_P-20*Y_P);
                aircraft3.center = CGPointMake(WIDTH+80+300*X_P-25*X_P, 455*Y_P+20*Y_P);
            }else{
                aircraft1.center = CGPointMake(-80, 455*Y_P);
                aircraft2.center = CGPointMake(-80+25*X_P, 455*Y_P+20*Y_P);
                aircraft3.center = CGPointMake(-80-25*X_P, 455*Y_P-20*Y_P);
            }
        } completion:^(BOOL finished) {
            [_enemyAircraftPlayer stop];
            [aircraft1 removeFromSuperview];
            [aircraft2 removeFromSuperview];
            [aircraft3 removeFromSuperview];
        }];
    }];
}




#pragma mark 漏水DOT的Check方法
- (void)checkLeakDOT{
    if (_isLeak) {
        [self playerLifeDownAndDieCheckWithDamage:LEAK_DAMAGE_ONE_SEC colorType:playerLifeDownTypeDOT];
    }
    if (_isLeak&&_timerRunningTime==(_leakStartRunTime+LEAK_TIME_DURATION)%10000000) {
        [self stopLeakEffect];
    }
}


#pragma mark 关于漏水效果的方法
- (void)stopLeakEffect{
    if (_mainPlayer.seOpen) {
        [_leakEffectPlayer stop];
    }
    
    for (UIImageView * leak in _leak_effect_array) {
        [leak stopAnimating];
    }
    _isLeak = NO;
    if (_isFire==NO) {
        _repair_btn.enabled = NO;
    }
}


- (void)startLeakEffect{
    if (_mainPlayer.seOpen) {
        _leakEffectPlayer = [AMETools getMP3PlayerWithFileName:@"se_e_leak" RuntimeCount:0];
        [_leakEffectPlayer play];
    }
    if (_mainPlayer.seOpen) {
        _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_e_leak_%d",arc4random()%VOICE_EFFECT_LEAK_COUNT] RuntimeCount:1];
        [_voicePlayer2 play];
    }
    for (UIImageView * leak in _leak_effect_array) {
        [leak startAnimating];
    }
    _leakStartRunTime = _timerRunningTime;
    _isLeak = YES;
    NSLog(@"_mainPlayer.p_detectorNum===%ld",_mainPlayer.p_detectorNum);
    if (_mainPlayer.p_repairNum>0) {
        _repair_btn.enabled = YES;
    }
}

- (void)createLeakEffectView{
    _leak_effect_array = [NSMutableArray arrayWithCapacity:3];
    UIImageView * leak1 = [[UIImageView alloc]initWithFrame:CGRectMake(280*X_P, _WSGView.frame.origin.y-30*Y_P, 50*X_P, 50*Y_P)];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:4];
    for (int i=0; i<4; i++) {
        arr[i] = [UIImage imageNamed:[NSString stringWithFormat:@"e_leak_%d",i]];
    }
    leak1.animationImages = arr;
    leak1.alpha = 0.7;
    leak1.animationDuration = 1.0;
    [_leak_effect_array addObject:leak1];
    [self.view addSubview:leak1];
    
    UIImageView * leak2 = [[UIImageView alloc]initWithFrame:CGRectMake(70*X_P, _WSGView.frame.origin.y+40*Y_P, 50*X_P, 50*Y_P)];
    leak2.animationImages = arr;
    leak2.alpha = 0.7;
    leak2.animationDuration = 1.0;
    [_leak_effect_array addObject:leak2];
    [self.view addSubview:leak2];
    
    UIImageView * leak3 = [[UIImageView alloc]initWithFrame:CGRectMake(140*X_P, _WSGView.frame.origin.y+120*Y_P, 50*X_P, 50*Y_P)];
    leak3.animationImages = arr;
    leak3.alpha = 0.7;
    leak3.animationDuration = 1.0;
    [_leak_effect_array addObject:leak3];
    [self.view addSubview:leak3];
    
}

#pragma mark 火焰DOT的Check方法
- (void)checkFireDOT{
    if (_isFire) {
        [self playerLifeDownAndDieCheckWithDamage:FIRE_DAMAGE_ONE_SEC colorType:playerLifeDownTypeDOT];
    }
    if (_isFire&&_timerRunningTime==(_fireStartRunTime+FIRE_TIME_DURATION)%10000000) {
        [self stopFireEffect];
    }
}


#pragma mark 关于火焰效果的方法
- (void)stopFireEffect{
    if (_mainPlayer.seOpen) {
        [_fireEffectPlayer stop];
    }
    for (UIImageView * fire in _fire_effect_array) {
        [fire stopAnimating];
    }
    _isFire = NO;
    if (_isLeak==NO) {
        _repair_btn.enabled = NO;
    }
}


- (void)startFireEffect{
    
    if (_mainPlayer.seOpen) {
        _fireEffectPlayer = [AMETools getMP3PlayerWithFileName:@"se_e_fire" RuntimeCount:0];
        [_fireEffectPlayer play];
    }
    
    if (_mainPlayer.seOpen) {
        _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_e_fire_%d",arc4random()%VOICE_EFFECT_FIRE_COUNT] RuntimeCount:1];
        [_voicePlayer2 play];
    }
    
    for (UIImageView * fire in _fire_effect_array) {
        [fire startAnimating];
    }
    _fireStartRunTime = _timerRunningTime;
    _isFire = YES;
    if (_mainPlayer.p_repairNum>0) {
        _repair_btn.enabled = YES;
    }
}

- (void)createFireEffectView{
    _fire_effect_array = [NSMutableArray arrayWithCapacity:3];
    UIImageView * fire1 = [[UIImageView alloc]initWithFrame:CGRectMake(140*X_P, _WSGView.frame.origin.y-30*Y_P, 50*X_P, 50*Y_P)];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:4];
    for (int i=0; i<4; i++) {
        arr[i] = [UIImage imageNamed:[NSString stringWithFormat:@"e_fire_%d",i]];
    }
    fire1.animationImages = arr;
    fire1.alpha = 0.7;
    fire1.animationDuration = 1.0;
    [_fire_effect_array addObject:fire1];
    [self.view addSubview:fire1];
    
    UIImageView * fire2 = [[UIImageView alloc]initWithFrame:CGRectMake(280*X_P, _WSGView.frame.origin.y+40*Y_P, 50*X_P, 50*Y_P)];
    fire2.animationImages = arr;
    fire2.alpha = 0.7;
    fire2.animationDuration = 1.0;
    [_fire_effect_array addObject:fire2];
    [self.view addSubview:fire2];
    
    UIImageView * fire3 = [[UIImageView alloc]initWithFrame:CGRectMake(70*X_P, _WSGView.frame.origin.y+120*Y_P, 50*X_P, 50*Y_P)];
    fire3.animationImages = arr;
    fire3.alpha = 0.7;
    fire3.animationDuration = 1.0;
    [_fire_effect_array addObject:fire3];
    [self.view addSubview:fire3];
    
}


#pragma mark 初始化战机爆炸效果
- (AMEImage *)createAircraftBoom{
    AMEImage * aircraft_boom = [[AMEImage alloc]initWithFrame:CGRectMake(0, 0, 50*X_P, 50*Y_P)];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:4];
    for (int i=0; i<4; i++) {
        arr[i] = [UIImage imageNamed:[NSString stringWithFormat:@"a_boom_%d",i]];
    }
    aircraft_boom.animationImages = arr;
    aircraft_boom.animationduration = 1.5;
    aircraft_boom.animationRepeatCount = 1;
    return aircraft_boom;
}

//#pragma mark 检查敌军中是否有驱逐栖姬
//- (BOOL)enemyQuzhuqiji{
//    for (AMEEnemyButton * btn in _enemyArray) {
//        if (btn.info.shipType==en_quzhuqiji) {
//            return YES;
//        }
//    }
//    return NO;
//}
//
//
//#pragma mark 检查敌军驱逐舰的数量
//- (NSUInteger)enemyDestroyerCount{
//    NSUInteger count=0;
//    for (AMEEnemyButton * btn in _enemyArray) {
//        if (btn.info.shipType==en_destroyer) {
//            count++;
//        }
//    }
//    return count;
//}
//
//#pragma mark 检查敌军巡洋舰的数量
//- (NSUInteger)enemyCruiserCount{
//    NSUInteger count=0;
//    for (AMEEnemyButton * btn in _enemyArray) {
//        if (btn.info.shipType==en_cruiser) {
//            count++;
//        }
//    }
//    return count;
//}

#pragma mark 生成一组战机(飞航组道具)
- (void)moveAircraftAndBoomToFocus{
    AMEEnemyButton * btn = [self getFocusEnemy];
    if (_mainPlayer.seOpen) {
        _aircraftPlayer = [AMETools getMP3PlayerWithFileName:@"se_aircraft" RuntimeCount:0];
        [_aircraftPlayer play];
    }
    UIImageView * aircraft1;
    UIImageView * aircraft2;
    UIImageView * aircraft3;
    CGPoint point = btn.center;
    AMEImage * aircraft_boom1= [self createAircraftBoom];
    aircraft_boom1.center = point;
    [self.view addSubview:aircraft_boom1];
    AMEImage * aircraft_boom2= [self createAircraftBoom];
    aircraft_boom2.center = CGPointMake(point.x-10, point.y);
    [self.view addSubview:aircraft_boom2];
    AMEImage * aircraft_boom3= [self createAircraftBoom];
    aircraft_boom3.center = CGPointMake(point.x+10, point.y);
    [self.view addSubview:aircraft_boom3];
    if (point.x>WIDTH/2.0) {
        aircraft1 = [[UIImageView alloc]initWithFrame:CGRectMake(-80*X_P, HEIGHT-400*Y_P, 40*X_P, 40*Y_P)];
        aircraft2 = [[UIImageView alloc]initWithFrame:CGRectMake(-80*X_P+18*X_P, HEIGHT-400*Y_P+40*X_P, 40*X_P, 40*Y_P)];
        aircraft3 = [[UIImageView alloc]initWithFrame:CGRectMake(-80*X_P-30*X_P, HEIGHT-400*Y_P-24*X_P, 40*X_P, 40*Y_P)];
        aircraft1 = [AMETools makeRotation:aircraft1 speedX:point.x-aircraft1.center.x speedY:point.y-aircraft1.center.y];
        aircraft2 = [AMETools makeRotation:aircraft2 speedX:point.x+18*X_P-aircraft2.center.x speedY:point.y+40*Y_P-aircraft2.center.y];
        aircraft3 = [AMETools makeRotation:aircraft3 speedX:point.x-30*X_P-aircraft3.center.x speedY:point.y-24*Y_P-aircraft3.center.y];
    }else{
        aircraft1 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80*X_P, HEIGHT-400*Y_P, 40*X_P, 40*Y_P)];
        aircraft2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80*X_P+30*X_P, HEIGHT-400*Y_P-28*X_P, 40*X_P, 40*Y_P)];
        aircraft3 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+80*X_P-18*X_P, HEIGHT-400*Y_P+40*X_P, 40*X_P, 40*Y_P)];
        aircraft1 = [AMETools makeRotation:aircraft1 speedX:point.x-aircraft1.center.x speedY:point.y-aircraft1.center.y];
        aircraft2 = [AMETools makeRotation:aircraft2 speedX:point.x+30*X_P-aircraft2.center.x speedY:point.y-28*Y_P-aircraft2.center.y];
        aircraft3 = [AMETools makeRotation:aircraft3 speedX:point.x-18*X_P-aircraft3.center.x speedY:point.y+40*Y_P-aircraft3.center.y];
    }
    aircraft1.image = [UIImage imageNamed:@"aircraft"];
    [self.view addSubview:aircraft1];

    aircraft2.image = [UIImage imageNamed:@"aircraft"];
    [self.view addSubview:aircraft2];
    
    aircraft3.image = [UIImage imageNamed:@"aircraft"];
    [self.view addSubview:aircraft3];
    
    [UIView animateWithDuration:3.0 animations:^{
        if (point.x>WIDTH/2.0) {
            aircraft1.center = point;
            aircraft2.center = CGPointMake(point.x+18*X_P, point.y+40*Y_P);
            aircraft3.center = CGPointMake(point.x-30*X_P, point.y-24*Y_P);
        }else{
            aircraft1.center = point;
            aircraft2.center = CGPointMake(point.x+30*X_P, point.y-28*Y_P);
            aircraft3.center = CGPointMake(point.x-18*X_P, point.y+40*Y_P);
        }
    } completion:^(BOOL finished) {
        if (_mainPlayer.seOpen) {
            _aircraftBoomPlayer = [AMETools getWAVPlayerWithFileName:@"se_aircraft_boom" RuntimeCount:1];
            _aircraftBoomPlayer.volume = 0.8;
            [_aircraftBoomPlayer play];
        }
        
        [aircraft_boom1 startAnimation];
        [aircraft_boom2 startAnimation];
        [aircraft_boom3 startAnimation];
        //每艘巡洋舰降低40%飞航队道具的攻击力,最多降低80%
        //多次轰炸同一目标 每次效果降低40%
        NSInteger damage = AIRCRAFT_BASIC_DAMAGE*(1+self.level*0.1)*(1-_cruiserCount*0.4)*(1-btn.info.airBoomTimes*0.4);
        //被轰炸次数+1
        btn.info.airBoomTimes++;
        BOOL damageYellow = NO;
        if (_cruiserCount>0) {
            damageYellow = YES;
        }
        if (damage<AIRCRAFT_BASIC_DAMAGE*(1+self.level*0.1)*(1-0.8)) {
            damage = AIRCRAFT_BASIC_DAMAGE*(1+self.level*0.1)*(1-0.8);
        }
        [self enemyDamaged:damage enemyBtn:btn yellow:damageYellow];
        [UIView animateWithDuration:2.0 animations:^{
            aircraft1.transform = CGAffineTransformMakeRotation(0);
            aircraft2.transform = CGAffineTransformMakeRotation(0);
            aircraft3.transform = CGAffineTransformMakeRotation(0);
            if (point.x>WIDTH/2.0) {
                aircraft1.center = CGPointMake(WIDTH+80*X_P, -80*Y_P);
                aircraft2.center = CGPointMake(WIDTH+80*X_P+30*X_P, -80*Y_P-28*Y_P);
                aircraft3.center = CGPointMake(WIDTH+80*X_P-18*X_P, -80*Y_P+40*Y_P);
            }else{
                aircraft1.center = CGPointMake(-80*X_P, -80*Y_P);
                aircraft2.center = CGPointMake(-80*X_P+18*X_P, -80*Y_P+40*Y_P);
                aircraft3.center = CGPointMake(-80*X_P-30*X_P, -80*Y_P-24*Y_P);
            }
        }completion:^(BOOL finished) {
            [_aircraftPlayer stop];
            [aircraft1 removeFromSuperview];
            [aircraft2 removeFromSuperview];
            [aircraft3 removeFromSuperview];
        }];
    }];
}


#pragma mark 初始化鱼雷爆炸效果
- (AMEImage *)createTorpedoBoom{
    AMEImage * torpedo_boom = [[AMEImage alloc]initWithFrame:CGRectMake(0, 0, 25*X_P, 25*Y_P)];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:8];
    for (int i=0; i<8; i++) {
        arr[i] = [UIImage imageNamed:[NSString stringWithFormat:@"t_boom_%d",i]];
    }
    torpedo_boom.animationImages = arr;
    torpedo_boom.animationduration = 0.5;
    torpedo_boom.animationRepeatCount = 3;
    return torpedo_boom;
}


#pragma mark 生成一枚鱼雷 并到指定位置爆炸(鱼雷道具)
- (void)moveTorpedoAndBoomToEnemyBtn:(AMEEnemyButton *)btn{
    UIImageView * torpedo = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random()%(NSUInteger)WIDTH, 380*Y_P, 5*X_P, 25*Y_P)];
    torpedo.image = [UIImage imageNamed:@"torpedo"];
    torpedo.alpha = 0.6;
    CGPoint point = CGPointMake(btn.center.x, btn.center.y+20*Y_P);
    torpedo = [AMETools makeRotation:torpedo speedX:point.x-torpedo.center.x speedY:point.y-torpedo.center.y];
    [self.view addSubview:torpedo];
    
    [UIView animateWithDuration:4.0 animations:^{
        torpedo.center = point;
    } completion:^(BOOL finished) {
        [torpedo removeFromSuperview];
        //制造伤害并检测 鱼雷伤害每次衰减20%
        NSUInteger damage = TORPEDO_BASIC_DAMAGE*(1+_mainPlayer.lv_torpedo*0.055)*(1-btn.info.torpedoBoomTimes*0.2);
        btn.info.torpedoBoomTimes++;
        if (damage<TORPEDO_BASIC_DAMAGE*(1+_mainPlayer.lv_torpedo*0.055)*0.2) {
            damage=TORPEDO_BASIC_DAMAGE*(1+_mainPlayer.lv_torpedo*0.055)*0.2;
        }
        [self enemyDamaged:damage enemyBtn:btn yellow:NO];
        
        if (_mainPlayer.seOpen) {
            _torpedoPlayer = [AMETools getWAVPlayerWithFileName:@"se_torpedo_boom" RuntimeCount:1];
            [_torpedoPlayer play];
        }
        
        AMEImage * torpedo_boom = [self createTorpedoBoom];
        torpedo_boom.center = point;
        [self.view addSubview:torpedo_boom];
        [torpedo_boom startAnimation];
    }];
}


#pragma mark 创建选择框
- (void)createSelectedView{
    _selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 280*Y_P, 230*X_P, 80*Y_P)];
    [self.view addSubview:_selectedView];
    
    UIImageView * img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 230*X_P, 80*Y_P)];
    img1.image = [UIImage imageNamed:@"mainViewSmall"];
    img1.tag = 1;
    img1.alpha = 0.6;
    [_selectedView addSubview:img1];
    
    _selectedView_array = [NSMutableArray arrayWithCapacity:3];
}

#pragma mark 创建舰娘view
- (void)createWSGView{
    _WSGView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 359*Y_P, WIDTH, 230*Y_P)];
    _WSGView.contentSize = CGSizeMake(WIDTH*2, 230*Y_P);
    UIImageView * img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 230*Y_P)];
    img1.image = [UIImage imageNamed:@"mainView_1"];
    img1.tag = 1;
    img1.alpha = 0.6;
    [_WSGView addSubview:img1];
    UIImageView * img2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-1, 0, WIDTH, 230*Y_P)];
    img2.image = [UIImage imageNamed:@"mainView_2"];
    img2.alpha = 0.6;
    img2.tag = 1;
    [_WSGView addSubview:img2];
    _WSGView.showsHorizontalScrollIndicator = NO;
    _WSGView.bounces = NO;
    _WSGView.pagingEnabled = YES;
    [self.view addSubview:_WSGView];
}

#pragma mark 创建玩家血条
- (void)createPlayerLifeView{
    _playerLifeView = [[AMEProgress alloc]initWithFrame:CGRectMake(-3*X_P, 580*Y_P, WIDTH+6*X_P, 52*Y_P)];
    _playerLifeView.progressImage = [UIImage imageNamed:@"pro_front"];
    _playerLifeView.trackImage = [UIImage imageNamed:@"pro_back"];
    _playerLifeView.progress = 1.0;
    [self.view addSubview:_playerLifeView];
}

#pragma 创建底部操控栏
- (void)createBottomView{
    _bottom_btn_array = [NSMutableArray arrayWithCapacity:5];
    
    _bottomView = [[UIImageView alloc]initWithFrame:CGRectMake(0, HEIGHT-78*Y_P, WIDTH, 80*Y_P)];
    _bottomView.image = [UIImage imageNamed:@"bottom_bar"];
    [self.view addSubview:_bottomView];
    
    _bottomView.userInteractionEnabled = YES;
    _fire_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fire_btn setImage:[UIImage imageNamed:@"FIRE"] forState:UIControlStateNormal];
    [_fire_btn setImage:[UIImage imageNamed:@"FIRE_black"] forState:UIControlStateDisabled];
    _fire_btn.frame = CGRectMake((WIDTH-80*X_P)/2.0, 5*Y_P, 80*X_P, 70*Y_P);
    _fire_btn.tag = 100;
    _fire_btn.enabled = NO;
    [_bottom_btn_array addObject:_fire_btn];
    [_bottomView addSubview:_fire_btn];
    
    _torpedo_res = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.p_torpedoNum] strokeWidth:2.0 size:15];
    _torpedo_res.frame = CGRectMake(48*X_P, 60*Y_P, 24*X_P, 20*Y_P);
    [_bottomView addSubview:_torpedo_res];
    
    _torpedo_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_torpedo_btn setImage:[UIImage imageNamed:@"b_torpedo"] forState:UIControlStateNormal];
    [_torpedo_btn setImage:[UIImage imageNamed:@"b_torpedo_black"] forState:UIControlStateDisabled];
    _torpedo_btn.tag =101;
    [_bottom_btn_array addObject:_torpedo_btn];
    _torpedo_btn.frame = CGRectMake(15*X_P, 36*Y_P, 40*X_P, 40*Y_P);
    [_bottomView addSubview:_torpedo_btn];
    
    _aircraft_res = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.p_aircraftNum] strokeWidth:2.0 size:15];
    _aircraft_res.frame = CGRectMake(118*X_P, 60*Y_P, 24*X_P, 20*Y_P);
    [_bottomView addSubview:_aircraft_res];
    
    _aircraft_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_aircraft_btn setImage:[UIImage imageNamed:@"b_aircraft"] forState:UIControlStateNormal];
    [_aircraft_btn setImage:[UIImage imageNamed:@"b_aircraft_black"] forState:UIControlStateDisabled];
    _aircraft_btn.tag =102;
    [_bottom_btn_array addObject:_aircraft_btn];
    _aircraft_btn.frame = CGRectMake(80*X_P, 36*Y_P, 40*X_P, 40*Y_P);
    [_bottomView addSubview:_aircraft_btn];
    
    _detector_res = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.p_detectorNum] strokeWidth:2.0 size:15];
    _detector_res.frame = CGRectMake(273*X_P, 60*Y_P, 24*X_P, 20*Y_P);
    [_bottomView addSubview:_detector_res];
    
    _detector_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_detector_btn setImage:[UIImage imageNamed:@"b_detector"] forState:UIControlStateNormal];
    [_detector_btn setImage:[UIImage imageNamed:@"b_detector_black"] forState:UIControlStateDisabled];
    _detector_btn.tag =103;
    [_bottom_btn_array addObject:_detector_btn];
    _detector_btn.frame = CGRectMake(240*X_P, 36*Y_P, 40*X_P, 40*Y_P);
    [_bottomView addSubview:_detector_btn];
    
    _repair_res = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.p_repairNum] strokeWidth:2.0 size:15];
    _repair_res.frame = CGRectMake(343*X_P, 60*Y_P, 24*X_P, 20*Y_P);
    [_bottomView addSubview:_repair_res];
    
    _repair_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_repair_btn setImage:[UIImage imageNamed:@"b_repair"] forState:UIControlStateNormal];
    [_repair_btn setImage:[UIImage imageNamed:@"b_repair_black"] forState:UIControlStateDisabled];
    _repair_btn.tag =104;
    [_bottom_btn_array addObject:_repair_btn];
    _repair_btn.frame = CGRectMake(310*X_P, 36*Y_P, 40*X_P, 40*Y_P);
    [_bottomView addSubview:_repair_btn];
    
    for (UIButton * btn in _bottom_btn_array) {
        [btn addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark 存档与读档
- (void)loadSaveToPlayer:(AMESave *)save{
    _mainPlayer.playerName = save.playerName;
    _mainPlayer.s_fuelNum = save.s_fuelNum;
    _mainPlayer.s_steelNum = save.s_steelNum;
    _mainPlayer.s_ammunitionNum = save.s_ammunitionNum;
    _mainPlayer.s_aluminiumNum = save.s_aluminiumNum;
    _mainPlayer.coinNum = save.coinNum;
    _mainPlayer.lv_fire = save.lv_fire;
    _mainPlayer.lv_torpedo = save.lv_torpedo;
    _mainPlayer.lv_antiaircraft = save.lv_antiaircraft;
    _mainPlayer.lv_armoured = save.lv_armoured;
    _mainPlayer.p_detectorNum = save.p_detectorNum;
    _mainPlayer.p_repairNum = save.p_repairNum;
    _mainPlayer.p_torpedoNum = save.p_torpedoNum;
    _mainPlayer.p_aircraftNum = save.p_aircraftNum;
    _mainPlayer.bgmOpen = save.bgmOpen;
    _mainPlayer.seOpen = save.seOpen;
    _mainPlayer.nowLevel = save.nowLevel;
    _mainPlayer.indexWSG = save.indexWSG;
}

- (void)playerToSave:(AMESave *)save{
    save.playerName = _mainPlayer.playerName;
    save.s_fuelNum = _mainPlayer.s_fuelNum;
    save.s_steelNum = _mainPlayer.s_steelNum;
    save.s_ammunitionNum = _mainPlayer.s_ammunitionNum;
    save.s_aluminiumNum  = _mainPlayer.s_aluminiumNum ;
    save.coinNum = _mainPlayer.coinNum;
    save.lv_fire = _mainPlayer.lv_fire ;
    save.lv_torpedo = _mainPlayer.lv_torpedo ;
    save.lv_antiaircraft = _mainPlayer.lv_antiaircraft;
    save.lv_armoured = _mainPlayer.lv_armoured ;
    save.p_detectorNum = _mainPlayer.p_detectorNum ;
    save.p_repairNum = _mainPlayer.p_repairNum;
    save.p_torpedoNum = _mainPlayer.p_torpedoNum;
    save.p_aircraftNum = _mainPlayer.p_aircraftNum ;
    save.bgmOpen = _mainPlayer.bgmOpen ;
    save.seOpen = _mainPlayer.seOpen;
    save.nowLevel = _mainPlayer.nowLevel;
    save.indexWSG = _mainPlayer.indexWSG;
}

#pragma mark 更新道具信息
- (void)updateProp{
    _torpedo_res.text = [NSString stringWithFormat:@"%lu",_mainPlayer.p_torpedoNum];
    _aircraft_res.text = [NSString stringWithFormat:@"%lu",_mainPlayer.p_aircraftNum];
    _detector_res.text = [NSString stringWithFormat:@"%lu",_mainPlayer.p_detectorNum];
    _repair_res.text = [NSString stringWithFormat:@"%lu",_mainPlayer.p_repairNum];
    if (_mainPlayer.p_torpedoNum==0) {
        _torpedo_btn.enabled = NO;
    }
    if (_mainPlayer.p_aircraftNum==0) {
        _aircraft_btn.enabled = NO;
    }
    if (_mainPlayer.p_detectorNum==0) {
        _detector_btn.enabled = NO;
    }
    if (_mainPlayer.p_repairNum==0||(_isFire==NO&&_isLeak==NO)) {
        _repair_btn.enabled = NO;
    }
}


#pragma mark 按下按钮
- (void)ButtonTouchUpInside:(UIButton *)btn{
    switch (btn.tag) {
            //fire
        case 100:{
            [_mainJudger judgeWithButtonArray:_selectedView_array];
            [self createCompareLevelView];
        }break;
            //back
        case 1000:{
            if (_selectedView_array.count==1) {
                [self WSGButtonTouchUPInside:_selectedView_array[0]];
            }else if (_selectedView_array.count==2) {
                [self WSGButtonTouchUPInside:_selectedView_array[1]];
            }
        }break;
            
        case 101:{
            if (_mainPlayer.seOpen) {
                _torpedoPlayer = [AMETools getMP3PlayerWithFileName:@"se_torpedo" RuntimeCount:1];
                [_torpedoPlayer play];
            }
            if (_mainPlayer.seOpen) {
                _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_torpedo_%d",arc4random()%VOICE_TORPEDO_COUNT] RuntimeCount:1];
                [_voicePlayer2 play];
            }
            _mainPlayer.p_torpedoNum -= 1;
            for (AMEEnemyButton * btn in _enemyArray) {
                [self moveTorpedoAndBoomToEnemyBtn:btn];
            }
            [self updateProp];
        }break;
        case 102:{
            
            if (_mainPlayer.seOpen) {
                _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_aircraft_%d",arc4random()%VOICE_AIRCRAFT_COUNT] RuntimeCount:1];
                [_voicePlayer2 play];
            }
            
            _mainPlayer.p_aircraftNum -= 1;
            [self moveAircraftAndBoomToFocus];
            [self updateProp];
        }break;
        case 103:{
            if (_mainPlayer.seOpen) {
                _detectorPlayer = [AMETools getMP3PlayerWithFileName:@"se_detector" RuntimeCount:1];
                [_detectorPlayer play];
            }
            
            if (_mainPlayer.seOpen) {
                _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_detector_%d",arc4random()%VOICE_DETECTOR_COUNT] RuntimeCount:1];
                [_voicePlayer2 play];
            }
            
            _mainPlayer.p_detectorNum -= 1;
            [self startDetector];
            [self updateProp];
        }break;
        case 104:{
            if (_mainPlayer.seOpen) {
                _repairPlayer = [AMETools getMP3PlayerWithFileName:@"se_repair" RuntimeCount:1];
                [_repairPlayer play];
            }
            
            if (_mainPlayer.seOpen) {
                _voicePlayer2 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_repair_%d",arc4random()%VOICE_REPAIR_COUNT] RuntimeCount:1];
                [_voicePlayer2 play];
            }
            
            _mainPlayer.p_repairNum -= 1;
            [self stopFireEffect];
            [self stopLeakEffect];
            [self updateProp];
        }break;
        case 900:{
            if (_mainPlayer.seOpen) {
                _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_index" RuntimeCount:1];
                [_sePlayer play];
            }
            [self stopTimer];
            [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) next:^{
                AMELabel * notice = [AMETools createAMELabelWithText:@"要返回主界面吗?" strokeWidth:2.0 size:20];
                notice.frame = CGRectMake(0, 50*Y_P, _noticeBox.frame.size.width, 50*Y_P);
                notice.textAlignment = NSTextAlignmentCenter;
                [_noticeBox addSubview:notice];
                
                UIButton * return_btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [return_btn setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
                return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
                [return_btn addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
                return_btn.tag = 9001;
                [_noticeBox addSubview:return_btn];
                
                AMELevelButton * done_btn = [[AMELevelButton alloc]init];
                [done_btn setImage:[UIImage imageNamed:@"done_btn"] forState:UIControlStateNormal];
                done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
                done_btn.tag = 9002;
                [done_btn addTarget:self action:@selector(ButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
                [_noticeBox addSubview:done_btn];
            }];
        }break;
        case 9001:{
            if (_mainPlayer.seOpen) {
                _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_index" RuntimeCount:1];
                [_sePlayer play];
            }
            [self doReturnWithButton:btn];
            [self startTimer];
        }break;
        case 9002:{
            if (_mainPlayer.seOpen) {
                _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_index" RuntimeCount:1];
                [_sePlayer play];
            }
            [self.navigationController popViewControllerAnimated:NO];
        }break;
        case 901:{
            if (_mainPlayer.seOpen) {
                _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_index" RuntimeCount:1];
                [_sePlayer play];
            }
            if (btn.selected) {
                //开始
                [self moveUIInWithAnimation:YES btnAble:YES next:nil];
                [self startTimer];
                btn.selected = NO;
            }else{
                //暂停
                [self moveUIOutWithAnimation:YES btnAble:YES next:nil];
                [self stopTimer];
                btn.selected = YES;
            }
        }break;
    }
}

#pragma mark 关闭小窗
- (void)doReturnWithButton:(UIButton *)btn{
    UIView * temp = btn.superview;
    for (UIView * view in temp.subviews) {
        [view removeFromSuperview];
    }
    [UIView animateWithDuration:0.5 animations:^{
        temp.frame = CGRectMake(WIDTH/2.0, HEIGHT/2.0, 0, 0);
    } completion:^(BOOL finished) {
        [temp removeFromSuperview];
        [self moveUIInWithAnimation:YES btnAble:YES next:nil];
    }];
}

#pragma mark 创建小窗
- (void)createNoticeBoxWithImage:(UIImage *)image rect:(CGRect)rect next:(void(^)(void))comp{
    [self moveUIOutWithAnimation:YES btnAble:NO next:^{
        _noticeBox = [AMETools createSecBoxWith:image];
        _noticeBox.userInteractionEnabled = YES;
        [self.view addSubview:_noticeBox];
        [UIView animateWithDuration:0.3 animations:^{
            _noticeBox.frame = rect;
        } completion:^(BOOL finished) {
            comp();
        }];
    }];
}

#pragma mark UI移出屏幕 并让顶部button失效
- (void)moveUIOutWithAnimation:(BOOL)isAnimation btnAble:(BOOL)btnAble next:(void(^)(void))comp{
    if (isAnimation) {
        [UIView animateWithDuration:0.5 animations:^{
            _bottomView.center = CGPointMake(_bottomView.center.x, _bottomView.center.y+500*Y_P);
            _playerLifeView.center = CGPointMake(_playerLifeView.center.x, _playerLifeView.center.y+500*Y_P);
            _WSGView.center = CGPointMake(_WSGView.center.x, _WSGView.center.y+500*Y_P);
            _selectedView.center = CGPointMake(_selectedView.center.x, _selectedView.center.y+500*Y_P);
        } completion:^(BOOL finished) {
            if (comp!=nil) {
                comp();
            }
        }];
    }else{
        _bottomView.center = CGPointMake(_bottomView.center.x, _bottomView.center.y+500*Y_P);
        _playerLifeView.center = CGPointMake(_playerLifeView.center.x, _playerLifeView.center.y+500*Y_P);
        _WSGView.center = CGPointMake(_WSGView.center.x, _WSGView.center.y+500*Y_P);
        _selectedView.center = CGPointMake(_selectedView.center.x, _selectedView.center.y+500*Y_P);
    }
    if (btnAble==NO) {
        for (UIButton * btn in _top_btn_array) {
            btn.enabled = NO;
        }
    }else{
        for (UIButton * btn in _top_btn_array) {
            btn.enabled = YES;
        }
    }
}

#pragma mark UI移入屏幕 并让顶部button生效
//非万能方法 如果没执行UIOUT 不要调用这个方法
- (void)moveUIInWithAnimation:(BOOL)isAnimation btnAble:(BOOL)btnAble next:(void(^)(void))comp{
    if (isAnimation) {
        [UIView animateWithDuration:0.5 animations:^{
            _bottomView.center = CGPointMake(_bottomView.center.x, _bottomView.center.y-500*Y_P);
            _playerLifeView.center = CGPointMake(_playerLifeView.center.x, _playerLifeView.center.y-500*Y_P);
            _WSGView.center = CGPointMake(_WSGView.center.x, _WSGView.center.y-500*Y_P);
            _selectedView.center = CGPointMake(_selectedView.center.x, _selectedView.center.y-500*Y_P);
        } completion:^(BOOL finished) {
            if (comp!=nil) {
                comp();
            }
        }];
    }else{
        _bottomView.center = CGPointMake(_bottomView.center.x, _bottomView.center.y-500*Y_P);
        _playerLifeView.center = CGPointMake(_playerLifeView.center.x, _playerLifeView.center.y-500*Y_P);
        _WSGView.center = CGPointMake(_WSGView.center.x, _WSGView.center.y-500*Y_P);
        _selectedView.center = CGPointMake(_selectedView.center.x, _selectedView.center.y-500*Y_P);
    }
    
    if (btnAble==NO) {
        for (UIButton * btn in _top_btn_array) {
            btn.enabled = NO;
        }
    }else{
        for (UIButton * btn in _top_btn_array) {
            btn.enabled = YES;
        }
    }
}

#pragma mark 当已选数组修改的时候执行的判断
- (void)checkWhenSelected_arrayChange{
    [self cheakDetector];
    [self checkFireButton];
}

#pragma mark 检查firebutton的状态
- (void)checkFireButton{
    if (_selectedView_array.count==0) {
        _fire_btn.enabled = NO;
    }else if (_selectedView_array.count>0&&_selectedView_array.count<3){
        _fire_btn.enabled = YES;
        _fire_btn.tag = 1000;
        [_fire_btn setImage:[UIImage imageNamed:@"FIRE_back"] forState:UIControlStateNormal];
    }else if (_selectedView_array.count==3){
        _fire_btn.enabled = YES;
        _fire_btn.tag = 100;
        [_fire_btn setImage:[UIImage imageNamed:@"FIRE"] forState:UIControlStateNormal];
    }
}


#pragma mark 探测器的开始与停止
- (void)startDetector{
    _detectorON = YES;
    _detector_btn.enabled = NO;
    _detectorStartRunTime = _timerRunningTime;
}

- (void)stopDetector{
    _detectorON = NO;
    if (_mainPlayer.p_detectorNum>0) {
        _detector_btn.enabled = YES;
    }
    for (AMEWarShipGirsButton * btn in _WSGView_array) {
        btn.layer.sublayers[0].backgroundColor = [UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:0].CGColor;
    }
}

- (void)checkDetctorEnable{
    if (_timerRunningTime==(_detectorStartRunTime+30)%10000000) {
        [self stopDetector];
    }
}


#pragma mark 执行探测器判断并修改图层
- (void)cheakDetector{
    if (_detectorON) {
        for (AMEWarShipGirsButton * btn in _WSGView_array) {
            if ([self detectorCompare:btn]) {
                btn.layer.sublayers[0].backgroundColor = [UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:0].CGColor;
            }else{
                btn.layer.sublayers[0].backgroundColor = [UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:0.8].CGColor;
            }
        }
    }
}


#pragma mark 判断view中每一个元素与选中的元素是否有相等的属性 探测器主用方法
- (BOOL)detectorCompare:(AMEWarShipGirsButton *)viewBtn{
    if (_selectedView_array.count==0) {
        return YES;
    }else if(_selectedView_array.count==1){
        AMEWarShipGirsButton * btn1 = _selectedView_array[0];
        if (viewBtn.WarShipGirl.torpedo==btn1.WarShipGirl.torpedo){
            return YES;
        }else if (viewBtn.WarShipGirl.aircraft==btn1.WarShipGirl.aircraft){
            return YES;
        }else if (viewBtn.WarShipGirl.secGun==btn1.WarShipGirl.mainGunType){
            return YES;
        }else if (viewBtn.WarShipGirl.hairColor==btn1.WarShipGirl.hairColor) {
            return YES;
        }else if (viewBtn.WarShipGirl.shipType==btn1.WarShipGirl.shipType){
            return YES;
        }else if (viewBtn.WarShipGirl.nationality==btn1.WarShipGirl.nationality){
            return YES;
        }else if (viewBtn.WarShipGirl.mainGunType==btn1.WarShipGirl.mainGunType){
            return YES;
        }
        return NO;
    }else if (_selectedView_array.count==2){
        AMEWarShipGirsButton * btn1 = _selectedView_array[0];
        AMEWarShipGirsButton * btn2 = _selectedView_array[1];
        if (btn1.WarShipGirl.torpedo==btn2.WarShipGirl.torpedo && viewBtn.WarShipGirl.torpedo==btn1.WarShipGirl.torpedo){
            return YES;
        }else if (btn1.WarShipGirl.aircraft==btn2.WarShipGirl.aircraft && viewBtn.WarShipGirl.aircraft==btn1.WarShipGirl.aircraft){
            return YES;
        }else if (btn1.WarShipGirl.secGun==btn2.WarShipGirl.secGun && viewBtn.WarShipGirl.secGun==btn1.WarShipGirl.secGun){
            return YES;
        }else if (btn1.WarShipGirl.hairColor==btn2.WarShipGirl.hairColor && viewBtn.WarShipGirl.hairColor==btn1.WarShipGirl.hairColor) {
            return YES;
        }else if (btn1.WarShipGirl.shipType==btn2.WarShipGirl.shipType && viewBtn.WarShipGirl.shipType==btn1.WarShipGirl.shipType){
            return YES;
        }else if (btn1.WarShipGirl.nationality==btn2.WarShipGirl.nationality && viewBtn.WarShipGirl.nationality==btn1.WarShipGirl.nationality){
            return YES;
        }else if (btn1.WarShipGirl.mainGunType==btn2.WarShipGirl.mainGunType && viewBtn.WarShipGirl.mainGunType==btn1.WarShipGirl.mainGunType){
            return YES;
        }
        return NO;
    }else if (_selectedView_array.count==3){
        return YES;
    }
    return YES;
}





#pragma mark 创建compareView
- (void)createCompareLevelView{
    NSUInteger sameCount = 0;
    _fire_btn.enabled = NO;
    NSMutableArray * comArr = [NSMutableArray arrayWithCapacity:7];
    for (int i=0; i<7; i++) {
        UIImageView * com = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH,320*Y_P-i*18*Y_P, 85*X_P, 30*Y_P)];
        com.alpha = 0.8;
        if (_mainJudger.hairColorSame) {
            com.image = [UIImage imageNamed:@"r_hairSame"];
            sameCount++;
            _mainJudger.hairColorSame = NO;
        }else if (_mainJudger.nationalitySame){
            switch (_mainJudger.nationality) {
                case USA:com.image = [UIImage imageNamed:@"r_USA"]; break;
                case Japan:com.image = [UIImage imageNamed:@"r_JAP"]; break;
                case Germany:com.image = [UIImage imageNamed:@"r_GER"]; break;
                case Russian:com.image = [UIImage imageNamed:@"r_RUS"]; break;
                case UK:com.image = [UIImage imageNamed:@"r_UK"]; break;
                case NAother:com.image = [UIImage imageNamed:@"r_NAother"]; break;
            }
            sameCount++;
            _mainJudger.nationalitySame = NO;
        }else if (_mainJudger.shipTypeSame){
            switch (_mainJudger.shipType) {
                case battleship:com.image = [UIImage imageNamed:@"r_BB"];break;
                case cruiser:com.image = [UIImage imageNamed:@"r_CA"];break;
                case destroyer:com.image = [UIImage imageNamed:@"r_DD"];break;
                case aircraftCarrier:com.image = [UIImage imageNamed:@"r_CV"];break;
                case submarine:com.image = [UIImage imageNamed:@"r_SS"];break;
                case STother:com.image = [UIImage imageNamed:@"r_STother"];break;
            }
            sameCount++;
            _mainJudger.shipTypeSame = NO;
        }else if (_mainJudger.torpedoSame){
            if (_mainJudger.torpedo) {
                com.image = [UIImage imageNamed:@"r_isTorpedo"];
            }else{
                com.image = [UIImage imageNamed:@"r_noTorpedo"];
            }
            sameCount++;
            _mainJudger.torpedoSame = NO;
        }else if (_mainJudger.aircraftSame){
            if (_mainJudger.aircraft) {
                com.image = [UIImage imageNamed:@"r_isAircraft"];
            }else{
                com.image = [UIImage imageNamed:@"r_noAircraft"];
            }
            sameCount++;
            _mainJudger.aircraftSame = NO;
        }else if (_mainJudger.secGunSame){
            if (_mainJudger.secGun) {
                com.image = [UIImage imageNamed:@"r_isSec"];
            }else{
                com.image = [UIImage imageNamed:@"r_noSec"];
            }
            sameCount++;
            _mainJudger.secGunSame = NO;
        }else if (_mainJudger.mainGunTypeSame){
            com.image = [UIImage imageNamed:@"r_calSame"];
            sameCount++;
            _mainJudger.mainGunTypeSame = NO;
        }
        [comArr addObject:com];
    }
    
    if (sameCount) {
        if (_mainPlayer.seOpen) {
            _voicePlayer1 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_fire_%d",   arc4random()%VOICE_FIRE_COUNT] RuntimeCount:1];
            [_voicePlayer1 play];
            
            _playerFirePlayer = [AMETools getMP3PlayerWithFileName:@"se_fire" RuntimeCount:1];
            [_playerFirePlayer play];
        }
    }else{
        if (_mainPlayer.seOpen) {
            _voicePlayer1 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_zero_%d",arc4random()%VOICE_ZERO_COUNT] RuntimeCount:1];
            [_voicePlayer1 play];
        }
    }
    
    
    UIImageView * compareView = [[UIImageView alloc]initWithFrame:CGRectMake(230*X_P,400*Y_P, WIDTH-230*X_P, 110*Y_P)];
    compareView.alpha = 0;
    switch (sameCount) {
        case 0:{compareView.image = [UIImage imageNamed:@"r_zero"];_att_0_count++;}break;
        case 1:{compareView.image = [UIImage imageNamed:@"r_one"];_att_1_count++;}break;
        case 2:{compareView.image = [UIImage imageNamed:@"r_two"];_att_2_count++;}break;
        case 3:{compareView.image = [UIImage imageNamed:@"r_three"];_att_3_count++;}break;
        case 4:{compareView.image = [UIImage imageNamed:@"r_four"];_att_4_count++;}break;
        case 5:{compareView.image = [UIImage imageNamed:@"r_five"];_att_5_count++;}break;
        case 6:{compareView.image = [UIImage imageNamed:@"r_six"];_att_6_count++;}break;
        case 7:{compareView.image = [UIImage imageNamed:@"r_seven"];_att_7_count++;}break;
    }
    [self.view addSubview:compareView];
    for (UIImageView * com in comArr) {
        [self.view addSubview:com];
    }
    //建立新button 并用一个临时数组存上
    NSMutableArray * newBtnArr = [NSMutableArray arrayWithCapacity:3];
    for (AMEWarShipGirsButton * btn in _selectedView_array) {
        //从大数组里删除
        [_WSGView_array removeObject:btn];
        //建立新button 位置是旧btn的lastframe
        AMEWarShipGirsButton * WSG_btn = [self createAWSGButtonWithFrame:btn.lastFrame];
        WSG_btn.alpha = 0;
        [_WSGView addSubview:WSG_btn];
        [_WSGView_array addObject:WSG_btn];
        [newBtnArr addObject:WSG_btn];
    }
    [UIView animateWithDuration:0.8 animations:^{
        compareView.frame = CGRectMake(230*X_P,250*Y_P, WIDTH-230*X_P, 110*Y_P);
        for (UIImageView * com in comArr) {
            CGRect temp = com.frame;
            temp.origin.x = 290*X_P;
            com.frame = temp;
        }
        compareView.alpha = 1;
        
        for (AMEWarShipGirsButton * newBtn in newBtnArr) {
            newBtn.alpha = 1;
        }
        for (AMEWarShipGirsButton * oldBtn in _selectedView_array) {
            oldBtn.alpha = 0;
        }
    } completion:^(BOOL finished) {
        //重新初始化 备用
        for (AMEWarShipGirsButton * oldBtn in _selectedView_array) {
            [oldBtn removeFromSuperview];
        }
        _selectedView_array = [NSMutableArray arrayWithCapacity:3];
        [self checkWhenSelected_arrayChange];
        _selectedIndex1 = NO;
        _selectedIndex2 = NO;
        _selectedIndex3 = NO;
        
        //相同点为0 惩罚爆炸
        if (sameCount==0) {
            
            if (_mainPlayer.seOpen) {
                _playerFirePlayer = [AMETools getWAVPlayerWithFileName:@"se_boom" RuntimeCount:2];
                [_playerFirePlayer play];
            }
            
            [self playerLifeDownAndDieCheckWithDamage:3.0 colorType:playerLifeDownTypeSelf];
            AMEImage * boom1 = [self createTorpedoBoom];
            boom1.frame = CGRectMake(80*X_P+arc4random()%200, 380*Y_P+arc4random()%60, 40, 40);
            [self.view addSubview:boom1];
            [boom1 startAnimation];
            
            AMEImage * boom2 = [self createTorpedoBoom];
            boom2.frame = CGRectMake(80*X_P+arc4random()%200, 380*Y_P+arc4random()%60, 40, 40);
            [self.view addSubview:boom2];
            [boom2 startAnimation];
            
            AMEImage * boom3 = [self createTorpedoBoom];
            boom3.frame = CGRectMake(80*X_P+arc4random()%200, 380*Y_P+arc4random()%60, 40, 40);
            [self.view addSubview:boom3];
            [boom3 startAnimation];
        }
        [self createBulletToEnemyBtn:[self getFocusEnemy] count:sameCount];
        [UIView animateWithDuration:2.0 animations:^{
            //这行卖萌用
            compareView.frame = CGRectMake(230.01*X_P,250*Y_P, WIDTH-230*X_P, 110*Y_P);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                compareView.frame = CGRectMake(230*X_P,400*Y_P, WIDTH-230*X_P, 110*Y_P);
                for (UIImageView * com in comArr) {
                    CGRect temp = com.frame;
                    temp.origin.x = WIDTH;
                    com.frame = temp;
                }
                compareView.alpha = 0;
            } completion:^(BOOL finished) {
                [compareView removeFromSuperview];
                for (UIImageView * com in comArr) {
                    [com removeFromSuperview];
                }
            }];
        }];
    }];
}



#pragma mark 按下舰娘按钮(向上或者向下移动)
- (void)WSGButtonTouchUPInside:(AMEWarShipGirsButton *)btn{
    NSLog(@"%@",btn.WarShipGirl);
    if (_mainPlayer.seOpen) {
        _wsgPlayer = [AMETools getMP3PlayerWithFileName:@"se_button_wsg" RuntimeCount:1];
        [_wsgPlayer play];
    }
    switch (btn.tag) {
        case 200:{
            if (_selectedView_array.count<3) {
                [_selectedView_array addObject:btn];
                [self checkWhenSelected_arrayChange];
                CGRect temp = btn.frame;
                [btn removeFromSuperview];
                [_selectedView addSubview:btn];
                temp.origin.y +=_WSGView.frame.origin.y-_selectedView.frame.origin.y;
                
                if (temp.origin.x>=WIDTH-5) {
                    temp.origin.x -= WIDTH;
                }
                btn.frame = temp;
                [UIView animateWithDuration:0.5 animations:^{
                    if (_selectedIndex1 == NO) {
                        btn.frame = CGRectMake(0, 0, SIZE_X, SIZE_Y);
                        _selectedIndex1 = YES;
                        btn.selectedIndex = 0;
                    }else if(_selectedIndex2 == NO){
                        btn.frame = CGRectMake(SIZE_X, 0, SIZE_X, SIZE_Y);
                        _selectedIndex2 = YES;
                        btn.selectedIndex = 1;
                    }else if(_selectedIndex3 == NO){
                        btn.frame = CGRectMake(SIZE_X*2, 0, SIZE_X, SIZE_Y);
                        _selectedIndex3 = NO;
                        btn.selectedIndex = 2;
                    }
                    btn.tag = 201;
                } completion:^(BOOL finished) {
                    
                }];
            }
        }break;
        case 201:{
            switch (btn.selectedIndex) {
                case 0:_selectedIndex1 = NO;break;
                case 1:_selectedIndex2 = NO;break;
                case 2:_selectedIndex3 = NO;break;
            }
            [_selectedView_array removeObject:btn];
            [self checkWhenSelected_arrayChange];
            
            [UIView animateWithDuration:0.5 animations:^{
                CGRect temp = btn.lastFrame;
                temp.origin.y +=_WSGView.frame.origin.y-_selectedView.frame.origin.y;
                //在右边 所有元素要向左
                if (_WSGView.contentOffset.x) {
                    temp.origin.x -=WIDTH;
                }
                btn.frame = temp;
            } completion:^(BOOL finished) {
                [_WSGView addSubview:btn];
                btn.frame = btn.lastFrame;
                btn.tag=200;
            }];
        }break;
    }
}


#pragma mark 初始化舰娘视图
- (void)initWSGView{
    //不管咋的 先清空了....
    for (UIView * view in _WSGView.subviews) {
        if (view.tag!=1) {
            [view removeFromSuperview];
        }
    }
    _WSGView_array = [NSMutableArray arrayWithCapacity:30];
    for (int i=0; i<30; i++) {
        NSUInteger line = i/10;
        NSUInteger list = i%10;
        AMEWarShipGirsButton * WSG_btn = [self createAWSGButtonWithFrame:CGRectMake(10*X_P+SIZE_X*list, SIZE_Y*line, SIZE_X, SIZE_Y)];
        [_WSGView addSubview:WSG_btn];
        _WSGView_array[i] = WSG_btn;
        
        CALayer * layer = [CALayer new];
        layer.frame = CGRectMake(0, 0, SIZE_X, SIZE_Y);
        layer.backgroundColor = [UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:0].CGColor;
        [WSG_btn.layer addSublayer:layer];
    }
}

#pragma mark 创建一个舰娘图标
- (AMEWarShipGirsButton *)createAWSGButtonWithFrame:(CGRect)rect{
    AMEWarShipGirsButton * WSG_btn;
    while (1) {
        WSG_btn = [AMEWarShipGirsButton getRandomWSG];
        if ([self checkWSGSame:WSG_btn]) {
            break;
        }
    }
    WSG_btn.frame = rect;
    WSG_btn.lastFrame = WSG_btn.frame;
    WSG_btn.tag=200;
    [WSG_btn addTarget:self action:@selector(WSGButtonTouchUPInside:) forControlEvents:UIControlEventTouchUpInside];
    return WSG_btn;
}

#pragma mark 判断舰娘是否重复
- (BOOL)checkWSGSame:(AMEWarShipGirsButton *)btn{
    for (AMEWarShipGirsButton * temp in _WSGView_array) {
        if (btn.WarShipGirl.warShipID == temp.WarShipGirl.warShipID) {
            return NO;
        }
    }
    return YES;
}
#pragma mark 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerLifeNow = 100.0;
        self.backgroundImage = [AMETools getPNGImageWithName:@"bg_common"];
        self.character = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[AMEPlayer defualtPlayer].indexWSG]];
        self.endCharacter = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",[AMEPlayer defualtPlayer].indexWSG]];
        self.characterName = [self getCharacterString];
        self.endCharacterName = [self getCharacterString];
        self.aircraftInterval = 2*60;
        self.torpedoInterval = 1*60;
        self.bgmPlayer = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"bgm_battle_%d",arc4random()%(BGM_BATTLE_COUNT-1)+1] RuntimeCount:0];
        
    }
    return self;
}
- (NSString *)getCharacterString{
    switch ([AMEPlayer defualtPlayer].indexWSG) {
        case SHIMAKAZE:return @"岛风";
        case YAMATO:return @"大和";
        case KONGOU:return @"金刚";
    }
}

#pragma mark 开始游戏的方法
- (void)gameStart{
    UIImageView * zhan = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, WIDTH*0.7, WIDTH*0.7/510.0*155)];
    zhan.center = CGPointMake(self.view.center.x, self.view.center.y+550);
    zhan.image = [AMETools getPNGImageWithName:@"zhan"];
    zhan.alpha = 0;
    [self.view addSubview:zhan];
    UIImageView * dou = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, WIDTH*0.7, WIDTH*0.7/510.0*155)];
    dou.center = CGPointMake(self.view.center.x, self.view.center.y+550);
    dou.image = [AMETools getPNGImageWithName:@"dou"];
    dou.alpha = 0;
    [self.view addSubview:dou];
    
    UIImageView * kai = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, WIDTH*0.7, WIDTH*0.7/510.0*155)];
    kai.center = CGPointMake(self.view.center.x, self.view.center.y+550);
    kai.image = [AMETools getPNGImageWithName:@"kai"];
    kai.alpha = 0;
    [self.view addSubview:kai];
    
    UIImageView * shi = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, WIDTH*0.7, WIDTH*0.7/510.0*155)];
    shi.center = CGPointMake(self.view.center.x, self.view.center.y+550);
    shi.image = [AMETools getPNGImageWithName:@"shi"];
    shi.alpha = 0;
    [self.view addSubview:shi];
    
    UIImageView * line = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, WIDTH*0.7, WIDTH*0.7/510.0*155)];
    line.center = CGPointMake(-WIDTH*0.7, self.view.center.y);
    line.image = [AMETools getPNGImageWithName:@"line"];
    line.alpha = 0;
    [self.view addSubview:line];
    
    if (_mainPlayer.seOpen) {
        _voicePlayer1 = [AMETools getMP3PlayerWithFileName:[NSString stringWithFormat:@"v_start_%d",arc4random()%VOICE_GAMESTART_COUNT] RuntimeCount:1];
        [_voicePlayer1 play];
    }
    
    
    [UIView animateWithDuration:0.5 animations:^{
        zhan.center = self.view.center;
        zhan.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            dou.center = self.view.center;
            dou.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                kai.center = self.view.center;
                kai.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    shi.center = self.view.center;
                    shi.alpha = 1;
                }completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.5 animations:^{
                        line.center = self.view.center;
                        line.alpha = 1;
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:1.0 animations:^{
                            //用来停住画面
                            line.center = CGPointMake(self.view.center.x+0.0001, self.view.center.y);
                        } completion:^(BOOL finished) {
                           [UIView animateWithDuration:0.5 animations:^{
                               line.center = CGPointMake(WIDTH+WIDTH*0.7, self.view.center.y);
                               zhan.center = CGPointMake(self.view.center.x, self.view.center.y+550);
                               dou.center = CGPointMake(self.view.center.x, self.view.center.y+550);
                               kai.center = CGPointMake(self.view.center.x, self.view.center.y+550);
                               shi.center = CGPointMake(self.view.center.x, self.view.center.y+550);
                               line.alpha = 0;
                               zhan.alpha = 0;
                               dou.alpha = 0;
                               kai.alpha = 0;
                               shi.alpha = 0;
                           } completion:^(BOOL finished) {
                               [zhan removeFromSuperview];
                               [dou removeFromSuperview];
                               [kai removeFromSuperview];
                               [shi removeFromSuperview];
                               [line removeFromSuperview];
                               [self moveUIInWithAnimation:YES btnAble:YES next:^{
                                   [self startTimer];
                               }];
                           }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}

-(void)dealEnemyArray{
    for (AMEEnemyButton * btn in _enemyArray) {
        [btn addTarget:self action:@selector(focusChange:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn.infoLabel];
        [self.view addSubview:btn];
        if (btn.info.shipType == en_destroyer) {
            _destroyerCount++;
        }else if (btn.info.shipType == en_cruiser){
            _cruiserCount++;
        }else if (btn.info.shipType == en_quzhuqiji){
            _isQuzhuqiji = YES;
        }else if (btn.info.shipType == en_qingxunqigui){
            _isQingxunqigui = YES;
        }else if (btn.info.shipType == en_zhanjianqiji){
            _isZhanjianqiji = YES;
        }else if (btn.info.shipType == en_kongmuqiji){
            _isKongmuqiji = YES;
        }else if (btn.info.shipType == en_gangwanqiji){
            _isGangwanqiji = YES;
        }else if (btn.info.shipType == en_zhongjianqiji){
            _isZhongjianqiji = YES;
        }else if (btn.info.shipType == en_beifangqiji){
            _isBeifangqiji = YES;
        }
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateProp];
    [self initWSGView];
    //要用敌军数组 所以放下面
    [self dealEnemyArray];
    [self createFocusView];
    [self moveUIOutWithAnimation:NO btnAble:NO next:nil];
}

#pragma mark 关于对话框功能的补充
- (void)createDialogUI{
    _characterView = [[UIImageView alloc]init];
    _characterView.frame = CGRectMake(WIDTH+WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
    if (isStart) {
        _characterView.image = self.endCharacter;
    }else{
        _characterView.image = self.character;
    }
    [self.view addSubview:_characterView];
    
    _dialogBox = [[UIControl alloc]init];
    _dialogBox.frame = CGRectMake(0, HEIGHT+HEIGHT*0.3, WIDTH, HEIGHT*0.3);
    [self.view addSubview:_dialogBox];
    
    UIImageView * dialogImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _dialogBox.frame.size.width, _dialogBox.frame.size.height)];
    dialogImage.image = [UIImage imageNamed:@"dialog_box"];
    dialogImage.alpha = 0.8;
    [_dialogBox addSubview:dialogImage];
    
    _dialogTilte_lbl = [[AMELabel alloc]initWithFrame:CGRectMake(WIDTH-135*X_P, 7*Y_P, 130*X_P, 50*Y_P)];
    _dialogTilte_lbl.text = self.characterName;
    _dialogTilte_lbl.strokeColor = [UIColor blackColor];
    _dialogTilte_lbl.fillColor = [UIColor whiteColor];
    _dialogTilte_lbl.strokeWidth = 3.0;
    _dialogTilte_lbl.textAlignment = NSTextAlignmentCenter;
    _dialogTilte_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:25*X_P];
    [_dialogBox addSubview:_dialogTilte_lbl];
    
    _text_lbl = [[AMELabel alloc]initWithFrame:CGRectMake(10*X_P, 70*Y_P, WIDTH-20*X_P, HEIGHT*0.3-75*Y_P)];
    _text_lbl.verticalAlignment = VerticalAlignmentTop;
    _text_lbl.text = @" ";
    _text_lbl.strokeColor = [UIColor blackColor];
    _text_lbl.fillColor = [UIColor whiteColor];
    _text_lbl.strokeWidth = 3.0;
    _text_lbl.numberOfLines = 0;
    _text_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:20*X_P];
    [_dialogBox addSubview:_text_lbl];
    
    [UIView animateWithDuration:1.0 animations:^{
        _characterView.frame = CGRectMake(WIDTH-WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
        _dialogBox.frame = CGRectMake(0, HEIGHT-HEIGHT*0.3, WIDTH, HEIGHT*0.3);
    } completion:^(BOOL finished) {
        if (!isStart) {
            _text_lbl.text = _dialogArray[0];
        }else{
            _text_lbl.text = _endArray[0];
        }
        [_text_lbl startAnime];
        [_dialogBox addTarget:self action:@selector(changeDialog) forControlEvents:UIControlEventTouchUpInside];
    }];
}

-(void)changeDialog{
    _dialog_index++;
    //对话结束 开始游戏
    if ((!isStart&&_dialog_index==_dialogArray.count)||(isStart&&_dialog_index==_endArray.count)) {
        [_dialogBox removeTarget:self action:@selector(changeDialog) forControlEvents:UIControlEventTouchUpInside];
        [UIView animateWithDuration:1.0 animations:^{
            _characterView.frame = CGRectMake(WIDTH+WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
            _dialogBox.frame = CGRectMake(0, HEIGHT+HEIGHT*0.3, WIDTH, HEIGHT*0.3);
        } completion:^(BOOL finished) {
            [_dialogBox removeFromSuperview];
            [_characterView removeFromSuperview];
            if (!isStart) {
                isStart = YES;
                _dialog_index = 0;
                [self gameStart];
            }else{
                [self createResult];
            }
            _dialogBox = nil;
            _characterView = nil;
        }];
    }else{
        if (!isStart) {
            NSArray * arr = [_dialogArray[_dialog_index] componentsSeparatedByString:@";"];
            if(arr.count==2){
                if ([arr[1]isEqualToString:@"ex"]) {//只换人物不换名称
                    _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",[AMEPlayer defualtPlayer].indexWSG]];;
                }else if ([arr[1]isEqualToString:@""]) {//只换人物不换名称
                    _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[AMEPlayer defualtPlayer].indexWSG]];
                }else{
                _characterView.image = [AMETools getPNGImageWithName:arr[1]];
                }
                _text_lbl.text = arr[0];
                [_text_lbl startAnime];
            }else if (arr.count>=3){//说明换了人物 且换了名称 >=3是防止手抽多打了一个;
                [UIView animateWithDuration:0.3 animations:^{
                    _characterView.frame = CGRectMake(WIDTH+WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
                } completion:^(BOOL finished) {
                    if ([arr[1]isEqualToString:@""]) {
                        _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[AMEPlayer defualtPlayer].indexWSG]];
                        _dialogTilte_lbl.text = [self getCharacterString];
                    }else if ([arr[1]isEqualToString:@"ex"]) {
                        _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",[AMEPlayer defualtPlayer].indexWSG]];
                        _dialogTilte_lbl.text = [self getCharacterString];
                    }else if ([arr[1]isEqualToString:@"self"]){
                        _characterView.image  = self.character;
                        _dialogTilte_lbl.text = self.characterName;
                    }else{
                        _characterView.image = [AMETools getPNGImageWithName:arr[1]];
                        _dialogTilte_lbl.text = arr[2];
                    }
                    [UIView animateWithDuration:0.3 animations:^{
                        _characterView.frame = CGRectMake(WIDTH-WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
                    } completion:^(BOOL finished) {
                        _text_lbl.text = arr[0];
                        [_text_lbl startAnime];
                    }];
                }];
            }else{
                _text_lbl.text = arr[0];
                [_text_lbl startAnime];
            }
        }else{
            NSArray * arr = [_endArray[_dialog_index] componentsSeparatedByString:@";"];
            if(arr.count==2){
                if ([arr[1]isEqualToString:@"ex"]) {//只换人物不换名称
                    _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",[AMEPlayer defualtPlayer].indexWSG]];;
                }else if ([arr[1]isEqualToString:@""]) {//只换人物不换名称
                    _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[AMEPlayer defualtPlayer].indexWSG]];
                }else{
                    _characterView.image = [AMETools getPNGImageWithName:arr[1]];
                }
                _text_lbl.text = arr[0];
                [_text_lbl startAnime];
            }else if (arr.count>=3){//说明换了人物 且换了名称 >=3是防止手抽多打了一个;
                [UIView animateWithDuration:0.3 animations:^{
                    _characterView.frame = CGRectMake(WIDTH+WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
                } completion:^(BOOL finished) {
                    if ([arr[1]isEqualToString:@""]) {
                        _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[AMEPlayer defualtPlayer].indexWSG]];
                        _dialogTilte_lbl.text = [self getCharacterString];
                    }else if ([arr[1]isEqualToString:@"ex"]) {
                        _characterView.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",[AMEPlayer defualtPlayer].indexWSG]];
                        _dialogTilte_lbl.text = [self getCharacterString];
                    }else if ([arr[1]isEqualToString:@"self"]){
                        _characterView.image  = self.endCharacter;
                        _dialogTilte_lbl.text = self.endCharacterName;
                    }else{
                        _characterView.image = [AMETools getPNGImageWithName:arr[1]];
                        _dialogTilte_lbl.text = arr[2];
                    }
                    [UIView animateWithDuration:0.3 animations:^{
                        _characterView.frame = CGRectMake(WIDTH-WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
                    } completion:^(BOOL finished) {
                        _text_lbl.text = arr[0];
                        [_text_lbl startAnime];
                    }];
                }];
            }else{
                _text_lbl.text = arr[0];
                [_text_lbl startAnime];
            }
        }
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (_dialogArray&&_dialogArray.count) {
        [self createDialogUI];
    }else{
        [self gameStart];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)home{
    [_bgmPlayer stop];
    [_aircraftPlayer stop];
    [_enemyAircraftPlayer stop];
    [_leakEffectPlayer stop];
    [_fireEffectPlayer stop];
    UIButton * temp = _top_btn_array[1];
    BOOL state = temp.enabled;
    [self ButtonTouchUpInside:temp];
    for (UIButton * btn in _top_btn_array) {
        btn.enabled = state;
    }
    
}
- (void)back{
    if (_mainPlayer.bgmOpen) {
        [_bgmPlayer play];
    }
}


@end
