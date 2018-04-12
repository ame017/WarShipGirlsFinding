//
//  IndexViewController.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/5/31.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "IndexViewController.h"


#import "Level_1.h"
#import "Level_2.h"
#import "Level_3.h"
#import "Level_4.h"
#import "Level_5.h"
#import "Level_6.h"
#import "Level_7.h"
#import "Level_8.h"
#import "Level_9.h"
#import "Level_10.h"
#import "Level_11.h"
#import "Level_12.h"
#import "Level_13.h"
#import "Level_14.h"
#import "Level_15.h"
#import "Level_16.h"
#import "Level_17.h"
#import "Level_18.h"
#import "Level_19.h"
#import "Level_20.h"
#import "Level_21.h"
#import "Level_22.h"
#import "Level_23.h"
#import "Level_24.h"
#import "Level_25.h"
#import "Level_26.h"
#import "Level_27.h"
#import "Level_28.h"
#import "Level_29.h"
#import "Level_30.h"
#import "Level_31.h"
#import "Level_32.h"
#import "Level_33.h"
#import "Level_34.h"
#import "Level_35.h"
#import "Level_36.h"
#import "Level_37.h"
#import "Level_38.h"
#import "Level_39.h"
#import "Level_40.h"
#import "Level_41.h"
#import "Level_42.h"
#import "Level_43.h"
#import "Level_44.h"
#import "Level_45.h"
#import "Level_46.h"
#import "Level_47.h"
#import "Level_48.h"
#import "Level_49.h"
#import "Level_50.h"



#define TEXT_GREEN [UIColor colorWithRed:110/255.0 green: 180/255.0 blue:110/255.0 alpha:1]
#define TEXT_RED [UIColor colorWithRed:1.0 green:110/255.0 blue:110/255.0 alpha:1]



#define DETECTOR_COST 80
#define REPAIR_COST 50
#define TORPEDO_COST 150
#define AIRCRAFT_COST 100




long S_P(NSUInteger i){
     return (long)pow(i*25*i*25,1.0/3);
}
long C_P(NSUInteger i){
     return (long)pow(i*i*i,1.0/2.0)*40;
}

@interface IndexViewController ()<UITextFieldDelegate>
{
     AVAudioPlayer * _bgmPlayer;
     AVAudioPlayer * _sePlayer;
     BOOL isShow;
     
     NSUInteger _lastSave;
     AMEPlayer * _mainPlayer;
     AMESave * _save1;
     AMESave * _save2;
     AMESave * _save3;
     //背景
     UIImageView * _bg;

     //人物
     UIImageView * _character;

     //对话框
     UIImageView * _dialogBox;
     AMELabel * _dialogTilte_lbl;
     AMELabel * _text_lbl;
     //灰度层
     UIView * _grayView;

     //按钮组
     UIView * _buttonView;
     UIButton * _level_btn;
     UIButton * _save_btn;
     UIButton * _load_btn;
     UIButton * _remould_btn;
     UIButton * _seting_btn;

     //顶部装饰条
     UIImageView * _top_box;

     //资源栏
     UIView * _resourcesView;
     UILabel * _fuel_lbl;
     UILabel * _ammunition_lbl;
     UILabel * _steel_lbl;
     UILabel * _aluminium_lbl;
     UILabel * _coin_lbl;

     //二级栏
     UIImageView * _optionView;
     
     //内部临时资源
     AMELabel * _coin_lbl_inside;
     AMELabel * _fuel_lbl_inside;
     AMELabel * _ammunition_lbl_inside;
     AMELabel * _steel_lbl_inside;
     AMELabel * _aluminium_lbl_inside;
     
     AMELabel * _lv_armoured_lv;
     AMELabel * _lv_armoured_sNeed;
     AMELabel * _lv_armoured_coinNeed;
     AMELabel * _lv_armoured_change_lbl;
     
     AMELabel * _lv_antiaircraft_lv;
     AMELabel * _lv_antiaircraft_sNeed;
     AMELabel * _lv_antiaircraft_coinNeed;
     AMELabel * _lv_antiaircraft_change_lbl;
     
     AMELabel * _lv_torpedo_lv;
     AMELabel * _lv_torpedo_sNeed;
     AMELabel * _lv_torpedo_coinNeed;
     AMELabel * _lv_torpedo_change_lbl;
     
     AMELabel * _lv_fire_lv;
     AMELabel * _lv_fire_sNeed;
     AMELabel * _lv_fire_coinNeed;
     AMELabel * _lv_fire_change_lbl;
     
     AMELabel * _p_detector_res_lbl;
     AMELabel * _p_torpedo_res_lbl;
     AMELabel * _p_repair_res_lbl;
     AMELabel * _p_aircraft_res_lbl;
     
     AMELabel * _p_torpedo_sNeed;
     AMELabel * _p_detector_sNeed;
     AMELabel * _p_repair_sNeed;
     AMELabel * _p_aircraft_sNeed;
     
     UIButton * _lv_up_btn;
     NSMutableArray * _remould_btn_array;
     
     UIImageView * _noticeBox;
     NSMutableArray * _sl_btn_array;
     
     NSMutableArray * _option_btn_array;
     
     UITextField * _name_field;
     UIScrollView * _level_view;
     UIButton * _level_return_btn;
     NSMutableArray * _level_btn_array;
}

@end

@implementation IndexViewController




- (void)viewDidLoad {
     [super viewDidLoad];
     
     _mainPlayer = [AMEPlayer defualtPlayer];
     
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(home) name:@"home" object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(back) name:@"back" object:nil];
     
    //隐藏状态栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //背景
    _bg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _bg.image = [UIImage imageNamed:@"bg_1.jpg"];
    [self.view addSubview:_bg];
    //buttonView
    [self createButtonView];
     //resourcesView
     [self createResourcesView];
     //灰度页面 做效果用
     _grayView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
     _grayView.backgroundColor = [UIColor grayColor];
     _grayView.alpha = 0;
     [self.view addSubview:_grayView];
     
     //人物
     [self createCharacter];
     //对话框
     [self createDialogBox];
    //顶端装饰框
     [self createTopBox];
    


}



- (void)buttonTouchUpInside:(UIButton *)btn{
     if (btn.tag!=101&&btn.tag!=102&&btn.tag!=103&&btn.tag!=104&&btn.tag!=105) {
          if (_mainPlayer.seOpen) {
               _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_index" RuntimeCount:1];
               [_sePlayer play];
          }
     }
    switch (btn.tag) {
          //新游戏
         case 99:{
              if ([_name_field.text isEqualToString:@""]) {
                   _text_lbl.text = @"提督名不能为空哦~";
                   [_text_lbl startAnime];
              }else{
                   if (_lastSave==0) {
                        _lastSave = 1;
                        [self saveLastSaveIndex];
                   }
                   //赋值给存档 进行存档 再读取存档
                   [self saveIndex:_lastSave].playerName = _name_field.text;
                   [[self saveIndex:_lastSave] saveWithIndex:_lastSave];
                   [self loadSaveToPlayer:[self saveIndex:_lastSave]];
                   _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
                   _dialogTilte_lbl.text = [self getCharacterString];
                   [self doReturnWithButton:btn text:@"欢迎新提督!从今天起,镇守府的各位听从您的差遣!" smile:NO makeEnableArray:_buttonView.subviews];
              }
         }break;
        case 101:
        {
//             //跳关:调试用
//             _mainPlayer.nowLevel = 51;
//             
//             //
             if (_mainPlayer.seOpen) {
                  _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_option" RuntimeCount:1];
                  [_sePlayer play];
             }
             
             _text_lbl.text = @"选择关卡~要起航了哦~提督!";
             [_text_lbl startAnime];
             _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
             [self createLevelViewWithImage:nil rect:CGRectMake(10*X_P, 80*Y_P, WIDTH-20*X_P, 370*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
                  [self createLevelSelectView];
             }];
             
        }break;
              //开启存档页面
        case 102:
        {
             if (_mainPlayer.seOpen) {
                  _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_option" RuntimeCount:1];
                  [_sePlayer play];
             }
             
             _text_lbl.text = @"请选择您想存档的位置";
             [_text_lbl startAnime];
             _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
             [self createOptionViewWithImage:[UIImage imageNamed:@"option_box"] rect:CGRectMake(0, 100*Y_P, WIDTH, 350*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
                  [self createSaveOrLoad:YES];
             }];
            
        }break;
              //开启读取页面
        case 103:
        {
             if (_mainPlayer.seOpen) {
                  _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_option" RuntimeCount:1];
                  [_sePlayer play];
             }
             
             _text_lbl.text = @"请选择您想读取的存档";
             [_text_lbl startAnime];
             _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
             [self createOptionViewWithImage:[UIImage imageNamed:@"option_box"] rect:CGRectMake(0, 100*Y_P, WIDTH, 350*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
                  [self createSaveOrLoad:NO];
             }];
            
        }break;
              //开启remould页面
        case 104:
        {
             if (_mainPlayer.seOpen) {
                  _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_option" RuntimeCount:1];
                  [_sePlayer play];
             }
             
             _text_lbl.text = @"镇守府的改造";
             [_text_lbl startAnime];
             _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
             [self createOptionViewWithImage:[UIImage imageNamed:@"option_box"] rect:CGRectMake(0, 50*Y_P, WIDTH, 430*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
                  [self createRemouldView];
             }];
            
        }break;
              //开启OPtion页面
        case 105:
        {
             if (_mainPlayer.seOpen) {
                  _sePlayer = [AMETools getMP3PlayerWithFileName:@"se_button_option" RuntimeCount:1];
                  [_sePlayer play];
             }
             
             _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
             [self createOptionViewWithImage:[UIImage imageNamed:@"option_box"] rect:CGRectMake(0, 100*Y_P, WIDTH, 350*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
                  [self createOptionView];
             }];
             
        }break;
         case 201:
         {
              if (btn.selected==YES) {
                   btn.selected = NO;
                   _mainPlayer.bgmOpen = NO;
                   [_bgmPlayer stop];
              }else{
                   btn.selected = YES;
                   _mainPlayer.bgmOpen = YES;
                   [_bgmPlayer play];
              }
              
         }break;
         case 202:
         {
              if (btn.selected==YES) {
                   btn.selected = NO;
                   _mainPlayer.seOpen = NO;
              }else{
                   btn.selected = YES;
                   _mainPlayer.seOpen = YES;
              }
         }break;
            
        case 203:
        {
             _text_lbl.text = @"请输入要修改的提督名";
             [_text_lbl startAnime];
             [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_option_btn_array next:^{
                  [self createNameChangeNotice:NO];
             }];
            
            
        }break;
         case 2030:
         {
              [self doReturnWithButton:btn text:@"不改名了吗?果然还是原来的名字最好!" smile:NO makeEnableArray:_option_btn_array];
         }break;
         case 2031:
         {
              if ([_name_field.text isEqualToString:@""]) {
                   _text_lbl.text = @"提督名不能为空哦~";
                   [_text_lbl startAnime];
              }else{
                   _mainPlayer.playerName = _name_field.text;
                   AMESave * indexSave = [self saveIndex:_lastSave];
                   [self playerToSave:indexSave];
                   [indexSave saveWithIndex:_lastSave];
                   [self doReturnWithButton:btn text:@"改名完成了哦!新名字也很好听呢!" smile:NO makeEnableArray:_option_btn_array];
              }
              
         }break;
        case 204:
        {
               _text_lbl.text = @"请选择为您服务的舰娘";
               [_text_lbl startAnime];
             [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_option_btn_array next:^{
                  [self createWSGChangeBtn];
             }];
            
        }break;
         case 2041:{
              _mainPlayer.indexWSG = SHIMAKAZE;
              NSLog(@"_mainPlayer.indexWSG===%lu",_mainPlayer.indexWSG);
              _dialogTilte_lbl.text = [self getCharacterString];
              AMESave * indexSave = [self saveIndex:_lastSave];
              [self playerToSave:indexSave];
              [indexSave saveWithIndex:_lastSave];
              [self doReturnWithButton:btn text:@"已更换首页舰娘" smile:NO makeEnableArray:_option_btn_array];
         }break;
         case 2042:{
              _mainPlayer.indexWSG = YAMATO;
              NSLog(@"_mainPlayer.indexWSG===%lu",_mainPlayer.indexWSG);
              _dialogTilte_lbl.text = [self getCharacterString];
              AMESave * indexSave = [self saveIndex:_lastSave];
              [self playerToSave:indexSave];
              [indexSave saveWithIndex:_lastSave];
              [self doReturnWithButton:btn text:@"已更换首页舰娘" smile:NO makeEnableArray:_option_btn_array];
         }break;
         case 2043:{
              _mainPlayer.indexWSG = KONGOU;
              NSLog(@"_mainPlayer.indexWSG===%lu",_mainPlayer.indexWSG);
              _dialogTilte_lbl.text = [self getCharacterString];
              AMESave * indexSave = [self saveIndex:_lastSave];
              [self playerToSave:indexSave];
              [indexSave saveWithIndex:_lastSave];
              [self doReturnWithButton:btn text:@"已更换首页舰娘" smile:NO makeEnableArray:_option_btn_array];
         }break;
         case 205:
         {
              [self doReturnWithButton:btn text:@"设置完成!欢迎回来,提督!今天有什么想做的吗?" smile:YES makeEnableArray:_buttonView.subviews];
         }break;
         case 310:
         {
              _text_lbl.text = @"确认要升级吗?";
              [_text_lbl startAnime];
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_remould_btn_array next:^{
                   [self createNoticeBoxLvUp];
              }];
         }break;
         case 311:
         {
          [self doReturnWithButton:btn text:@"改造完成!现在感觉如何?提督~" smile:YES makeEnableArray:_buttonView.subviews];
              
         }break;
              
         case 3100:
         {
              
              [self doReturnWithButton:btn text:@"返回改造页面" smile:NO makeEnableArray:_remould_btn_array];
         }break;
         case 3101:
         {
              
              _coin_lbl.text = _coin_lbl_inside.text;
              _ammunition_lbl.text = _ammunition_lbl_inside.text;
              _aluminium_lbl.text = _aluminium_lbl_inside.text;
              _steel_lbl.text = _steel_lbl_inside.text;
              
              _mainPlayer.coinNum = [_coin_lbl.text integerValue];
              _mainPlayer.s_ammunitionNum = [_ammunition_lbl.text integerValue];
              _mainPlayer.s_aluminiumNum = [_aluminium_lbl.text integerValue];
              _mainPlayer.s_steelNum = [_steel_lbl.text integerValue];
              
              _mainPlayer.lv_fire = [_lv_fire_lv.text integerValue];
              _mainPlayer.lv_torpedo = [_lv_torpedo_lv.text integerValue];
              _mainPlayer.lv_antiaircraft = [_lv_antiaircraft_lv.text integerValue];
              _mainPlayer.lv_armoured = [_lv_armoured_lv.text integerValue];
              
              [self doReturnWithButton:btn text:@"升级完成!又变强了呢!" smile:NO makeEnableArray:_remould_btn_array];
              for (UIView * view in _optionView.subviews) {
                   [view removeFromSuperview];
              }
              [self createRemouldView];
         }break;
              
              
         case 3010:
         {
              [self subtractButtonLvBackWithLine:1];
         }break;
         case 3011:
         {
              [self addButtonLvUpWithLine:1];
         }break;
         case 3020:
         {
              [self subtractButtonLvBackWithLine:2];
         }break;
         case 3021:
         {
              [self addButtonLvUpWithLine:2];
         }break;
         case 3030:
         {
              [self subtractButtonLvBackWithLine:3];
         }break;
         case 3031:
         {
              [self addButtonLvUpWithLine:3];
         }break;
         case 3040:
         {
              [self subtractButtonLvBackWithLine:4];
         }break;
         case 3041:
         {
              [self addButtonLvUpWithLine:4];
         }break;
         case 3050:{
              _text_lbl.text = @"确认要购买吗?";
              [_text_lbl startAnime];
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_remould_btn_array next:^{
                   [self createNoticeBoxBuyWithCost:DETECTOR_COST];
              }];
         }break;
         case 3060:{
              _text_lbl.text = @"确认要购买吗?";
              [_text_lbl startAnime];
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_remould_btn_array next:^{
                   [self createNoticeBoxBuyWithCost:REPAIR_COST];
              }];
         }break;
         case 3070:{
              _text_lbl.text = @"确认要购买吗?";
              [_text_lbl startAnime];
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_remould_btn_array next:^{
                   [self createNoticeBoxBuyWithCost:TORPEDO_COST];
              }];
         }break;
         case 3080:{
              _text_lbl.text = @"确认要购买吗?";
              [_text_lbl startAnime];
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_remould_btn_array next:^{
                   [self createNoticeBoxBuyWithCost:AIRCRAFT_COST];
              }];
         }break;
         case 320:{
               [self doReturnWithButton:btn text:@"取消购买" smile:NO makeEnableArray:_remould_btn_array];
         }break;
         case 321:{
              //这里是个偷懒的写法 要求四个道具消耗的燃料不相等 读取cost的值
              for (UIView * view in btn.superview.subviews) {
                   if (view.tag==3210) {
                        AMELabel * temp =(AMELabel *)view;
                        NSUInteger cost = [temp.text integerValue];
                        switch (cost) {
                             case DETECTOR_COST:{
                                  _mainPlayer.p_detectorNum++;
                                  _p_detector_res_lbl.text = [NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_detectorNum];
                             }break;
                             case REPAIR_COST:{
                                  _mainPlayer.p_repairNum++;
                                  _p_repair_res_lbl.text = [NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_repairNum];
                             }break;
                             case TORPEDO_COST:{
                                  _mainPlayer.p_torpedoNum++;
                                  _p_torpedo_res_lbl.text = [NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_torpedoNum];
                             }break;
                             case AIRCRAFT_COST:{
                                  _mainPlayer.p_aircraftNum++;
                                  _p_aircraft_res_lbl.text = [NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_aircraftNum];
                             }break;
                        }
                        _mainPlayer.s_fuelNum -= cost;
                        _fuel_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.s_fuelNum];
                        _fuel_lbl_inside.text = _fuel_lbl.text;
                   }
              }
          [self doReturnWithButton:btn text:@"购买完成!要好好使用哦!提督!" smile:NO makeEnableArray:_remould_btn_array];
              
         }break;
         case 401:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:NO save:_save1];
              }];
         }break;
         case 402:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:NO save:_save2];
              }];
         }break;
         case 403:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:NO save:_save3];
              }];
         }break;
         case 404:{
              [self doReturnWithButton:btn text:@"取消读取...继续游戏呢,提督~" smile:YES makeEnableArray:_buttonView.subviews];
         }break;
         case 405:{
              [self doReturnWithButton:btn text:nil smile:NO makeEnableArray:_sl_btn_array];
         }break;
         case 501:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:YES save:_save1];
              }];
         }break;
         case 502:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:YES save:_save2];
              }];
         }break;
         case 503:{
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_sl_btn_array next:^{
                   [self createSaveOrLoadWarning:YES save:_save3];
              }];
         }break;
         case 504:{
              [self doReturnWithButton:btn text:@"不存档了吗?好吧,提督~" smile:YES makeEnableArray:_buttonView.subviews];
         }break;
         case 4001:{
              _lastSave = 1;
              [self loadAffirmWith:btn];
         }break;
         case 4002:{
              _lastSave = 2;
              [self loadAffirmWith:btn];
         }break;
         case 4003:{
              _lastSave = 3;
              [self loadAffirmWith:btn];
         }break;
         case 5001:{
              [self playerToSave:_save1];
              [_save1 saveWithIndex:1];
              [self doReturnWithButton:btn text:nil smile:NO makeEnableArray:_sl_btn_array];
              for (UIView * view in _optionView.subviews) {
                   [view removeFromSuperview];
              }
              [self createSaveOrLoad:YES];
         }break;
         case 5002:{
              [self playerToSave:_save2];
              [_save2 saveWithIndex:2];
              [self doReturnWithButton:btn text:nil smile:NO makeEnableArray:_sl_btn_array];
              for (UIView * view in _optionView.subviews) {
                   [view removeFromSuperview];
              }
              [self createSaveOrLoad:YES];
         }break;
         case 5003:{
              [self playerToSave:_save3];
              [_save3 saveWithIndex:3];
              [self doReturnWithButton:btn text:nil smile:NO makeEnableArray:_sl_btn_array];
              for (UIView * view in _optionView.subviews) {
                   [view removeFromSuperview];
              }
              [self createSaveOrLoad:YES];
         }break;
         case 600:{
              AMELevelButton * Lbtn = (AMELevelButton *)btn;
              [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_level_btn_array next:^{
                   [self createLevelSelectNoitceWithButton:Lbtn];
              }];
         }break;
         case 601:{
              [_level_return_btn removeFromSuperview];
              [self doReturnWithButton:btn text:@"取消关卡选择~" smile:NO makeEnableArray:_buttonView.subviews];
         }break;
         case 602:{
              [self doReturnWithButton:btn text:@"从新选择关卡呢~" smile:NO makeEnableArray:_level_btn_array];
         }break;
         case 603:{
              for (UIView * view in _noticeBox.subviews) {
                   [view removeFromSuperview];
              }
              [_noticeBox removeFromSuperview];
              for (UIView * view in _level_view.subviews) {
                   [view removeFromSuperview];
              }
              [_level_view removeFromSuperview];
              [_level_return_btn removeFromSuperview];
              [self makeUIControlAble:YES Array:_buttonView.subviews];
              AMELevelButton * Lbtn = (AMELevelButton *)btn;
              [self beginBattleWithLevel:Lbtn.level];
         }break;
        case 999://默认的return方式
        {
             [self doReturnWithButton:btn text:nil smile:NO makeEnableArray:[btn superview].subviews];
        }break;
    }
}

#pragma mark 创建舰娘button
- (void)createWSGChangeBtn{
     UIButton * shimakaze = [UIButton buttonWithType:UIButtonTypeCustom];
     shimakaze.frame = CGRectMake(115*X_P, 40*Y_P, 100*X_P, 30*Y_P);
     [shimakaze setImage:[UIImage imageNamed:@"shimakaze_btn"] forState:UIControlStateNormal];
     
     UIButton * yamato = [UIButton buttonWithType:UIButtonTypeCustom];
     yamato.frame = CGRectMake(115*X_P, 80*Y_P, 100*X_P, 30*Y_P);
     [yamato setImage:[UIImage imageNamed:@"yamato_btn"] forState:UIControlStateNormal];
     
     UIButton * kongou = [UIButton buttonWithType:UIButtonTypeCustom];
     kongou.frame = CGRectMake(115*X_P, 120*Y_P, 100*X_P, 30*Y_P);
     [kongou setImage:[UIImage imageNamed:@"kongou_btn"] forState:UIControlStateNormal];
     
     NSArray * arr = @[shimakaze,yamato,kongou];
     int i = 0;
     for (UIButton * btn in arr) {
          btn.tag = 2040+i+1;
          [btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
          [_noticeBox addSubview:btn];
          i++;
     }
}

#pragma mark 开启游戏界面
- (void)beginBattleWithLevel:(NSUInteger)level{
     //开打之前存个档
     [self playerToSave:[self saveIndex:_lastSave]];
     [[self saveIndex:_lastSave]saveWithIndex:_lastSave];
     switch (level) {
          case 1:[self.navigationController pushViewController:[Level_1 new] animated:NO];break;
          case 2:[self.navigationController pushViewController:[Level_2 new] animated:NO];break;
          case 3:[self.navigationController pushViewController:[Level_3 new] animated:NO];break;
          case 4:[self.navigationController pushViewController:[Level_4 new] animated:NO];break;
          case 5:[self.navigationController pushViewController:[Level_5 new] animated:NO];break;
          case 6:[self.navigationController pushViewController:[Level_6 new] animated:NO];break;
          case 7:[self.navigationController pushViewController:[Level_7 new] animated:NO];break;
          case 8:[self.navigationController pushViewController:[Level_8 new] animated:NO];break;
          case 9:[self.navigationController pushViewController:[Level_9 new] animated:NO];break;
          case 10:[self.navigationController pushViewController:[Level_10 new] animated:NO];break;
          case 11:[self.navigationController pushViewController:[Level_11 new] animated:NO];break;
          case 12:[self.navigationController pushViewController:[Level_12 new] animated:NO];break;
          case 13:[self.navigationController pushViewController:[Level_13 new] animated:NO];break;
          case 14:[self.navigationController pushViewController:[Level_14 new] animated:NO];break;
          case 15:[self.navigationController pushViewController:[Level_15 new] animated:NO];break;
          case 16:[self.navigationController pushViewController:[Level_16 new] animated:NO];break;
          case 17:[self.navigationController pushViewController:[Level_17 new] animated:NO];break;
          case 18:[self.navigationController pushViewController:[Level_18 new] animated:NO];break;
          case 19:[self.navigationController pushViewController:[Level_19 new] animated:NO];break;
          case 20:[self.navigationController pushViewController:[Level_20 new] animated:NO];break;
          case 21:[self.navigationController pushViewController:[Level_21 new] animated:NO];break;
          case 22:[self.navigationController pushViewController:[Level_22 new] animated:NO];break;
          case 23:[self.navigationController pushViewController:[Level_23 new] animated:NO];break;
          case 24:[self.navigationController pushViewController:[Level_24 new] animated:NO];break;
          case 25:[self.navigationController pushViewController:[Level_25 new] animated:NO];break;
          case 26:[self.navigationController pushViewController:[Level_26 new] animated:NO];break;
          case 27:[self.navigationController pushViewController:[Level_27 new] animated:NO];break;
          case 28:[self.navigationController pushViewController:[Level_28 new] animated:NO];break;
          case 29:[self.navigationController pushViewController:[Level_29 new] animated:NO];break;
          case 30:[self.navigationController pushViewController:[Level_30 new] animated:NO];break;
          case 31:[self.navigationController pushViewController:[Level_31 new] animated:NO];break;
          case 32:[self.navigationController pushViewController:[Level_32 new] animated:NO];break;
          case 33:[self.navigationController pushViewController:[Level_33 new] animated:NO];break;
          case 34:[self.navigationController pushViewController:[Level_34 new] animated:NO];break;
          case 35:[self.navigationController pushViewController:[Level_35 new] animated:NO];break;
          case 36:[self.navigationController pushViewController:[Level_36 new] animated:NO];break;
          case 37:[self.navigationController pushViewController:[Level_37 new] animated:NO];break;
          case 38:[self.navigationController pushViewController:[Level_38 new] animated:NO];break;
          case 39:[self.navigationController pushViewController:[Level_39 new] animated:NO];break;
          case 40:[self.navigationController pushViewController:[Level_40 new] animated:NO];break;
          case 41:[self.navigationController pushViewController:[Level_41 new] animated:NO];break;
          case 42:[self.navigationController pushViewController:[Level_42 new] animated:NO];break;
          case 43:[self.navigationController pushViewController:[Level_43 new] animated:NO];break;
          case 44:[self.navigationController pushViewController:[Level_44 new] animated:NO];break;
          case 45:[self.navigationController pushViewController:[Level_45 new] animated:NO];break;
          case 46:[self.navigationController pushViewController:[Level_46 new] animated:NO];break;
          case 47:[self.navigationController pushViewController:[Level_47 new] animated:NO];break;
          case 48:[self.navigationController pushViewController:[Level_48 new] animated:NO];break;
          case 49:[self.navigationController pushViewController:[Level_49 new] animated:NO];break;
          case 50:[self.navigationController pushViewController:[Level_50 new] animated:NO];break;
     }
}


#pragma mark 确认开始游戏
- (void)createLevelSelectNoitceWithButton:(AMELevelButton *)btn{
     AMELabel * notice = [AMETools createAMELabelWithText:@"" strokeWidth:3.0 size:20];
     notice.text = @"要开始游戏吗?";
     notice.frame = CGRectMake(0, 60*Y_P, _noticeBox.frame.size.width, 70*Y_P);
     notice.textAlignment = NSTextAlignmentCenter;
     notice.numberOfLines = 0;
     [_noticeBox addSubview:notice];
     
     _level_return_btn.enabled = NO;
     
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     return_btn.tag = 602;
     [_noticeBox addSubview:return_btn];
     
     AMELevelButton * done_btn = [[AMELevelButton alloc]init];
     [done_btn setImage:[UIImage imageNamed:@"done_btn"] forState:UIControlStateNormal];
     done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     done_btn.tag = 603;
     done_btn.level = btn.level;
     [done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:done_btn];
}

#pragma mark 生成选关界面
- (void)createLevelSelectView{
     if(_mainPlayer.nowLevel>49){
          _mainPlayer.nowLevel = 49;
     }
     _level_btn_array = [NSMutableArray arrayWithCapacity:50];
     for (int i=0; i<50; i++) {
          AMELevelButton * btn = [AMETools createLevelButtonWithAble:YES level:i+1];
          NSUInteger line = i%5;
          NSUInteger list = i/5;
          btn.frame = CGRectMake((list+1)*((WIDTH-20*X_P-140*X_P*2)/2.5)*X_P+list*140*X_P, (line+1)*18*Y_P+line*42*Y_P, 140*X_P, 42*Y_P);
          [_level_view addSubview:btn];
          btn.tag = 600;
          btn.level = i+1;
          [btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
          [_level_btn_array addObject:btn];
     }
     [self checkLevelbuttonEnable];
     _level_return_btn = [AMETools createReturnButton];
     _level_return_btn.tag = 601;
     _level_return_btn.frame = CGRectMake((WIDTH-80)/2.0, 400*Y_P, 80*X_P, 35*Y_P);
     [_level_return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:_level_return_btn];
     //计算levelView的偏移量
     AMELevelButton * lbtn = _level_btn_array[(_mainPlayer.nowLevel/10)*10];
     _level_view.contentOffset = CGPointMake(lbtn.frame.origin.x-22*X_P, 0);
}
#pragma mark 判断关卡是否解锁
- (void)checkLevelbuttonEnable{
     for (AMELevelButton * btn in _level_btn_array) {
          if (btn.level>_mainPlayer.nowLevel+1) {
               btn.enabled = NO;
          }
     }
}

#pragma mark 按下确认读取后执行的方法
- (void)loadAffirmWith:(UIButton *)btn{
     [self saveLastSaveIndex];
     for (UIView * view in _noticeBox.subviews) {
          [view removeFromSuperview];
     }
     [_noticeBox removeFromSuperview];
     for (UIView * view in _optionView.subviews) {
          [view removeFromSuperview];
     }
     [UIView animateWithDuration:0.5 animations:^{
          _grayView.alpha = 0;
          _optionView.frame = CGRectMake(WIDTH/2.0, HEIGHT/2.0, 0, 0);
     } completion:^(BOOL finished) {
          [_optionView removeFromSuperview];
          [self makeUIControlAble:YES Array:_buttonView.subviews];
          [self beginGame];
     }];
}

#pragma mark 存储默认存档
- (void)saveLastSaveIndex{
     [[NSUserDefaults standardUserDefaults]setObject:@(_lastSave) forKey:@"lastSave"];
}
#pragma mrak 读取存档
//如果没有lastsave在明文 说明没运行过 则是新游戏 返回no
//如果有值 但是lastsave中的save是nodata 说明是建立新游戏
- (BOOL)loadIndexSave{
     NSNumber * num = [[NSUserDefaults standardUserDefaults]objectForKey:@"lastSave"];
     if (num==nil) {
          return NO;//新游戏
     }else{
          _lastSave = [num integerValue];
          AMESave * indexSave = [self saveIndex:_lastSave];
          if (indexSave.isData == NO) {
               return NO;
          }
          [self loadSaveToPlayer:[self saveIndex:_lastSave]];
          _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
          _dialogTilte_lbl.text = [self getCharacterString];
     }
     return YES;
}

#pragma mark 更换提督名称

- (void)createNameChangeNotice:(BOOL)isNew{
     AMELabel * name = [AMETools createAMELabelWithText:@"提督名" strokeWidth:2.0 size:20];
     name.frame = CGRectMake(140*X_P, 50*Y_P, 100*X_P, 50*Y_P);
     [_noticeBox addSubview:name];
     
     UIButton * done_btn = [AMETools createDoneButtonWithAble:YES];
     _name_field = [[UITextField alloc]initWithFrame:CGRectMake(70*X_P, 70*Y_P, 200*X_P, 30*Y_P)];
     _name_field.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
     _name_field.borderStyle = UITextBorderStyleRoundedRect;
     _name_field.returnKeyType = UIReturnKeyDone;
     _name_field.textColor = [UIColor whiteColor];
     _name_field.delegate = self;
     if (isNew) {
          done_btn.frame = CGRectMake(130*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
          done_btn.tag = 99;
     }else{
          _name_field.text = _mainPlayer.playerName;
          done_btn.tag = 2031;
          done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
          UIButton * return_btn = [AMETools createReturnButton];
          return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
          [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
          return_btn.tag = 2030;
          [_noticeBox addSubview:return_btn];
     }
     [_noticeBox addSubview:_name_field];
     [done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:done_btn];
}

#pragma mark 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
     [_name_field resignFirstResponder];
     return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
     if (![_name_field isExclusiveTouch]) {
          [_name_field resignFirstResponder];
     }
}

#pragma mark 关于读取的方法
- (void)loadTheSaves{
     _save1 = [AMESave new];
     [_save1 loadWithIndex:1];
     _save2 = [AMESave new];
     [_save2 loadWithIndex:2];
     _save3 = [AMESave new];
     [_save3 loadWithIndex:3];
}

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
- (AMESave *)saveIndex:(NSUInteger)index{
     switch (index) {
          case 1:return _save1;break;
          case 2:return _save2;break;
          case 3:return _save3;break;
     }
     return nil;
}


#pragma mark 创建存档/读取确认页面
- (void)createSaveOrLoadWarning:(BOOL)isSave save:(AMESave *)save{
     AMELabel * notice = [AMETools createAMELabelWithText:@"" strokeWidth:3.0 size:20];
     if (isSave) {
          notice.text = @"要在这个档位存储吗?\n(原存档将会被覆盖)";
     }else{
          if (save.isData==NO) {
               notice.text = @"这个档位没有存档,要开始新游戏?\n(尚未保存的内容将会丢失)";
          }else{
               notice.text = @"要读取这个档位的数据吗?\n(尚未保存的内容将会丢失)";
          }
     }
     notice.frame = CGRectMake(0, 60*Y_P, _noticeBox.frame.size.width, 70*Y_P);
     notice.textAlignment = NSTextAlignmentCenter;
     notice.numberOfLines = 0;
     [_noticeBox addSubview:notice];
     
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     return_btn.tag = 405;
     [_noticeBox addSubview:return_btn];
     
     UIButton * done_btn = [AMETools createDoneButtonWithAble:YES];
     done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     if (isSave) {
          switch (save.playerID) {
               case 1:done_btn.tag = 5001;break;
               case 2:done_btn.tag = 5002;break;
               case 3:done_btn.tag = 5003;break;
          }
     }else{
          switch (save.playerID) {
               case 1:done_btn.tag = 4001;break;
               case 2:done_btn.tag = 4002;break;
               case 3:done_btn.tag = 4003;break;
          }
     }
     [done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:done_btn];
     
}



#pragma mark 创建存档/读档页面
- (void)createSaveOrLoad:(BOOL)isSave{
     [self loadTheSaves];
     
     _optionView.userInteractionEnabled = YES;
     
     AMELabel * title_lbl = [AMETools createAMELabelWithText:@"" strokeWidth:3.0 size:25.0];
     if (isSave) {
          title_lbl.text = @"存档";
     }else{
          title_lbl.text = @"读档";
     }
     title_lbl.frame = CGRectMake(0, 0, WIDTH, 25*Y_P);
     title_lbl.alpha = 0.8;
     title_lbl.textAlignment = NSTextAlignmentCenter;
     [_optionView addSubview:title_lbl];
     
     UIView * sl1 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08, WIDTH*0.84, 70*Y_P)];
     sl1.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.3];
     [_optionView addSubview:sl1];
     [self createSaveOrLoadCellWithSave:_save1 view:sl1];
     //加一个覆盖层 不然会点按不上
     UIControl * sl1_control = [[UIControl alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08, WIDTH*0.84, 70*Y_P)];
     [_optionView addSubview:sl1_control];
     
     UIView * sl2 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08+80*Y_P, WIDTH*0.84, 70*Y_P)];
     sl2.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.3];
     [_optionView addSubview:sl2];
     [self createSaveOrLoadCellWithSave:_save2 view:sl2];
     //加一个覆盖层 不然会点按不上
     UIControl * sl2_control = [[UIControl alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08+80*Y_P, WIDTH*0.84, 70*Y_P)];
     [_optionView addSubview:sl2_control];
     
     UIView * sl3 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08+160*Y_P, WIDTH*0.84, 70*Y_P)];
     sl3.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.3];
     [_optionView addSubview:sl3];
     [self createSaveOrLoadCellWithSave:_save3 view:sl3];
     //加一个覆盖层 不然会点按不上
     UIControl * sl3_control = [[UIControl alloc]initWithFrame:CGRectMake(WIDTH*0.08, HEIGHT*0.08+160*Y_P, WIDTH*0.84, 70*Y_P)];
     [_optionView addSubview:sl3_control];
     
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake((WIDTH-80*X_P)/2.0, _optionView.frame.size.height-50*Y_P, 80*X_P, 35*Y_P);
     [_optionView addSubview:return_btn];
     //添加事件和tag
     int i=1;
     _sl_btn_array = [NSMutableArray arrayWithCapacity:4];
     for (UIView * view in _optionView.subviews) {
          if ([view class]==[UIControl class]||[view class]==[UIButton class]) {
               UIControl * temp = (UIControl *)view;
               [temp addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
               if (isSave) {
                    temp.tag = 500+i;
               }else{
                    temp.tag = 400+i;
               }
               i++;
               [_sl_btn_array addObject:temp];
          }
     }
}

#pragma mark 创建存档/读档 cell
- (void)createSaveOrLoadCellWithSave:(AMESave *)save view:(UIView *)SLView{
     if (save.isData) {
          AMELabel * num_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"编号:%02ld",save.playerID] strokeWidth:2.0 size:15];
          num_lbl.frame = CGRectMake(25*X_P, 8*Y_P, 100*X_P, 15*Y_P);
          num_lbl.alpha = 0.8;
          [SLView addSubview:num_lbl];
          
          AMELabel * name_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"提督名:%@",save.playerName] strokeWidth:2.0 size:15];
          name_lbl.frame = CGRectMake(80*X_P, 8*Y_P, SLView.frame.size.width-80*X_P, 15*Y_P);
          name_lbl.alpha = 0.8;
          [SLView addSubview:name_lbl];
          
          AMELabel * level_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"当前进度\n第%02ld关",save.nowLevel+1] strokeWidth:2.0 size:15];
          level_lbl.frame = CGRectMake(220*X_P, 38*Y_P, 150*X_P, 30*Y_P);
          if (HEIGHT<500) {
               level_lbl.frame = CGRectMake(220*X_P, 45*Y_P, 150*X_P, 30*Y_P);
               level_lbl.text = [NSString stringWithFormat:@"当前第%02ld关",save.nowLevel+1];
          }
          level_lbl.alpha = 0.8;
          level_lbl.numberOfLines = 0;
          [SLView addSubview:level_lbl];
          
          UIView * s_view = [[UIView alloc]initWithFrame:CGRectMake(25*X_P, 20*Y_P, 300*X_P, 15*Y_P)];
          [SLView addSubview:s_view];
          NSArray * s_imgArr = @[@"s_fuel",@"s_ammunition",@"s_steel",@"s_aluminium",@"coin"];
          NSArray * s_valueArr = @[@(save.s_fuelNum),@(save.s_ammunitionNum),@(save.s_steelNum),@(save.s_aluminiumNum),@(save.coinNum)];
          [self createSTD_S_LV_PView:s_view imageArray:s_imgArr valueArray:s_valueArr];
          
          UIView * lv_view = [[UIView alloc]initWithFrame:CGRectMake(25*X_P, 35*Y_P, 300*X_P, 15*Y_P)];
          [SLView addSubview:lv_view];
          NSArray * lv_imgArr = @[@"lv_fire",@"lv_torpedo",@"lv_antiaircraft",@"lv_armoured"];
          NSArray * lv_valueArr = @[@(save.lv_fire),@(save.lv_torpedo),@(save.lv_antiaircraft),@(save.lv_armoured)];
          [self createSTD_S_LV_PView:lv_view imageArray:lv_imgArr valueArray:lv_valueArr];
          
          UIView * p_view = [[UIView alloc]initWithFrame:CGRectMake(25*X_P, 50*Y_P, 300*X_P, 15*Y_P)];
          [SLView addSubview:p_view];
          NSArray * p_imgArr = @[@"p_detector",@"p_repair",@"p_torpedo",@"p_aircraft"];
          NSArray * p_valueArr = @[@(save.p_detectorNum),@(save.p_repairNum),@(save.p_torpedoNum),@(save.p_aircraftNum)];
          [self createSTD_S_LV_PView:p_view imageArray:p_imgArr valueArray:p_valueArr];
     }else{
          AMELabel * nodata = [AMETools createAMELabelWithText:@"NODATA" strokeWidth:0.0 size:25];
          nodata.frame = CGRectMake(110*X_P, 20*Y_P, 200*X_P, 50*Y_P);
          nodata.alpha = 0.3;
          [SLView addSubview:nodata];
     }
     

}


#pragma mark 创建没有全局变量的仅供显示的资源框
- (void)createSTD_S_LV_PView:(UIView *)view imageArray:(NSArray<NSString *> *)imageArray valueArray:(NSArray<NSNumber *> *)valueArray{
     
     for (int i=0; i<imageArray.count; i++) {
          UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(50*i*X_P, 0, 15*X_P, 15*Y_P)];
          img.image = [UIImage imageNamed:imageArray[i]];
          [view addSubview:img];
          
          AMELabel * lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",[valueArray[i] integerValue]] strokeWidth:2.0 size:15];
          lbl.frame = CGRectMake(20*X_P+50*i*X_P, 0, 100*X_P, 20*Y_P);
          lbl.alpha = 0.8;
          [view addSubview:lbl];
     }
}

#pragma mark 确认购买
- (void)createNoticeBoxBuyWithCost:(NSUInteger)cost{
     AMELabel * notice = [AMETools createAMELabelWithText:@"购买将会消耗" strokeWidth:3.0 size:20];
     notice.frame = CGRectMake(0, 30*Y_P, WIDTH-40*X_P, 50*Y_P);
     notice.verticalAlignment = VerticalAlignmentMiddle;
     notice.textAlignment = NSTextAlignmentCenter;
     [_noticeBox addSubview:notice];
     
     UIImageView * s_fuel = [[UIImageView alloc]initWithFrame:CGRectMake(140*X_P, 70*Y_P, 20*X_P, 20*Y_P)];
     s_fuel.image = [UIImage imageNamed:@"s_fuel"];
     [_noticeBox addSubview:s_fuel];
     
     AMELabel * fuel_need = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%ld",cost] strokeWidth:3.0 size:20];
     fuel_need.tag = 3210;
     fuel_need.frame = CGRectMake(160*X_P, 70*Y_P, 40*X_P, 20*Y_P);
     fuel_need.textAlignment = NSTextAlignmentCenter;
     [_noticeBox addSubview:fuel_need];
     
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     return_btn.tag = 320;
     [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:return_btn];
     
     UIButton * done_btn = [AMETools createDoneButtonWithAble:YES];
     done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     done_btn.tag = 321;
     [done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:done_btn];
     
}



#pragma mark 确认升级
- (void)createNoticeBoxLvUp{
     AMELabel * notice = [AMETools createAMELabelWithText:@"升级将会消耗" strokeWidth:3.0 size:20];
     notice.frame = CGRectMake(0, 30*Y_P, WIDTH-40*X_P, 50*Y_P);
     notice.verticalAlignment = VerticalAlignmentMiddle;
     notice.textAlignment = NSTextAlignmentCenter;
     [_noticeBox addSubview:notice];
     
     UIImageView * s_ammunition = [[UIImageView alloc]initWithFrame:CGRectMake(40*X_P, 70*Y_P, 20*X_P, 20*Y_P)];
     s_ammunition.image = [UIImage imageNamed:@"s_ammunition"];
     [_noticeBox addSubview:s_ammunition];
     
     AMELabel * ammunition_need = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%ld",[_ammunition_lbl.text integerValue]-[_ammunition_lbl_inside.text integerValue]] strokeWidth:3.0 size:20];
     ammunition_need.frame = CGRectMake(60*X_P, 70*Y_P, 40*X_P, 20*Y_P);
     ammunition_need.textAlignment = NSTextAlignmentCenter;
     [_noticeBox addSubview:ammunition_need];
     
     UIImageView * s_steel = [[UIImageView alloc]initWithFrame:CGRectMake(100*X_P, 70*Y_P, 20*X_P, 20*Y_P)];
     s_steel.image = [UIImage imageNamed:@"s_steel"];
     [_noticeBox addSubview:s_steel];
     
     AMELabel * steel_need = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%ld",[_steel_lbl.text integerValue]-[_steel_lbl_inside.text integerValue]] strokeWidth:3.0 size:20];
     steel_need.textAlignment = NSTextAlignmentCenter;
     steel_need.frame = CGRectMake(120*X_P, 70*Y_P, 40*X_P, 20*Y_P);
     [_noticeBox addSubview:steel_need];
     
     UIImageView * s_aluminium = [[UIImageView alloc]initWithFrame:CGRectMake(160*X_P, 70*Y_P, 20*X_P, 20*Y_P)];
     s_aluminium.image = [UIImage imageNamed:@"s_aluminium"];
     [_noticeBox addSubview:s_aluminium];
     
     AMELabel * aluminium_need = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%ld",[_aluminium_lbl.text integerValue]-[_aluminium_lbl_inside.text integerValue]] strokeWidth:3.0 size:20];
     aluminium_need.frame = CGRectMake(180*X_P, 70*Y_P, 40*X_P, 20*Y_P);
     aluminium_need.textAlignment = NSTextAlignmentCenter;
     [_noticeBox addSubview:aluminium_need];
     
     UIImageView * coin = [[UIImageView alloc]initWithFrame:CGRectMake(220*X_P, 70*Y_P, 20*X_P, 20*Y_P)];
     coin.image = [UIImage imageNamed:@"coin"];
     [_noticeBox addSubview:coin];
     
     AMELabel * coin_need = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%ld",[_coin_lbl.text integerValue]-[_coin_lbl_inside.text integerValue]] strokeWidth:3.0 size:20];
     coin_need.frame = CGRectMake(240*X_P, 70*Y_P, 80*X_P, 20*Y_P);
     [_noticeBox addSubview:coin_need];
     
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake(80*X_P, _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     return_btn.tag = 3100;
     [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:return_btn];
     
     UIButton * done_btn = [AMETools createDoneButtonWithAble:YES];
     done_btn.frame = CGRectMake(180*X_P,  _noticeBox.frame.size.height-70*Y_P, 80*X_P, 35*Y_P);
     done_btn.tag = 3101;
     [done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_noticeBox addSubview:done_btn];

}



#pragma mark 生成关卡view
- (void)createLevelViewWithImage:(UIImage *)image rect:(CGRect)rect makeDisAbleArray:(nullable NSArray *)Array next:(void(^)(void))comp{
     [self makeUIControlAble:NO Array:Array];
     _level_view = [[UIScrollView alloc]initWithFrame:CGRectMake(WIDTH/2.0, HEIGHT/2.0, 0, 0)];
     _level_view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7];
     _level_view.contentSize = CGSizeMake(0, 0);
     _level_view.userInteractionEnabled = YES;
     _level_view.bounces = NO;
     [self.view addSubview:_level_view];
     [UIView animateWithDuration:0.3 animations:^{
          _level_view.frame = rect;
          CGSize size = rect.size;
          size.width = size.width*5-60*X_P;
          _level_view.contentSize = size;
     } completion:^(BOOL finished) {
//          _level_view.contentOffset = CGPointMake(_level_view.contentOffset.x+_mainPlayer.nowLevel/10*(_level_view.contentSize.width/5.0), _level_view.contentOffset.y);
          comp();
     }];
}



#pragma mark 生成notice
- (void)createNoticeBoxWithImage:(UIImage *)image rect:(CGRect)rect makeDisAbleArray:(nullable NSArray *)Array next:(void(^)(void))comp{
     [self makeUIControlAble:NO Array:Array];
     _noticeBox = [AMETools createSecBoxWith:image];
     _noticeBox.userInteractionEnabled = YES;
     [self.view addSubview:_noticeBox];
     [UIView animateWithDuration:0.3 animations:^{
          _noticeBox.frame = rect;
     } completion:^(BOOL finished) {
          comp();
     }];
}



#pragma mark 创建option
- (void)createOptionViewWithImage:(UIImage *)image rect:(CGRect)rect makeDisAbleArray:(nullable NSArray *)Array next:(void(^)(void))comp{
     [self makeUIControlAble:NO Array:Array];
     _optionView = [AMETools createSecBoxWith:image];
     [self.view addSubview:_optionView];
     [UIView animateWithDuration:0.3 animations:^{
          _grayView.alpha = 0.4;
          _optionView.frame = rect;
     } completion:^(BOOL finished) {
          comp();
     }];
}

#pragma mark 执行小页面关闭(返回)
- (void)doReturnWithButton:(UIButton *)btn text:(nullable NSString *)text smile:(BOOL)isSmile makeEnableArray:(nullable NSArray *)Array{
     UIView * temp;
     if (btn == _level_return_btn){
          temp = _level_view;
     }else{
          temp = [btn superview];
     }
     for (UIView * view in temp.subviews) {
          [view removeFromSuperview];
     }
     [UIView animateWithDuration:0.5 animations:^{
          if (temp==_optionView) {
               _grayView.alpha = 0;
          }
          temp.frame = CGRectMake(WIDTH/2.0, HEIGHT/2.0, 0, 0);
     } completion:^(BOOL finished) {
          [temp removeFromSuperview];
          [self makeUIControlAble:YES Array:Array];
          if (Array == _remould_btn_array) {
               [self checkButtonAddAndSubtract];
               [self checkAllBuyButton];
               _lv_up_btn.enabled = [self checkLvUpButton];
          }
          if (Array == _level_btn_array) {
               [self checkLevelbuttonEnable];
               _level_return_btn.enabled = YES;
          }
          if (text) {
               _text_lbl.text = text;
               [_text_lbl startAnime];
          }
          if (isSmile) {
               _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu_ex",_mainPlayer.indexWSG]];
          }else{
               _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG]];
          }
     }];
     //[self playerToSave:[self saveIndex:_lastSave]];
}


#pragma mark 创建remouldView
- (void)createRemouldView{
     //开启事件响应
     _optionView.userInteractionEnabled = YES;

     //标题
     AMELabel * remouldMain_lbl = [AMETools createAMELabelWithText:@"改造" strokeWidth:3.0 size:25.0];
     remouldMain_lbl.frame = CGRectMake(0, 10*Y_P, WIDTH, 25*Y_P);
     remouldMain_lbl.alpha = 0.8;
     remouldMain_lbl.textAlignment = NSTextAlignmentCenter;
     [_optionView addSubview:remouldMain_lbl];
     //虽然资源框在最下面 但是要先加载资源框 不然没有值
     UIView * resourcesView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.08, _optionView.frame.size.height*0.85, 200*X_P, 40*Y_P)];
     //     resourcesView.backgroundColor = [UIColor whiteColor];
     [_optionView addSubview:resourcesView];
     resourcesView.tag = 309;
     [self createResourceInsideWithView:resourcesView];

     //火力
     UIView * lv_fireView = [[UIView alloc]initWithFrame:CGRectMake(-8*X_P, _optionView.frame.size.height*0.15, WIDTH,50*Y_P)];
     lv_fireView.backgroundColor = [UIColor clearColor];
     lv_fireView.userInteractionEnabled = YES;
     [_optionView addSubview:lv_fireView];
     lv_fireView.tag = 301;
     [self createFireViewWithView:lv_fireView];
     //鱼雷
     UIView * lv_torpedoView = [[UIView alloc]initWithFrame:CGRectMake(-8*X_P, _optionView.frame.size.height*0.25, WIDTH,50*Y_P)];
     lv_torpedoView.backgroundColor = [UIColor clearColor];
     lv_torpedoView.userInteractionEnabled = YES;
     [_optionView addSubview:lv_torpedoView];
     lv_torpedoView.tag = 302;
     [self createTorpedoViewWithView:lv_torpedoView];
     //对空
     UIView * lv_antiaircraftView = [[UIView alloc]initWithFrame:CGRectMake(-8*X_P, _optionView.frame.size.height*0.35, WIDTH,50*Y_P)];
     lv_antiaircraftView.backgroundColor = [UIColor clearColor];
     lv_antiaircraftView.userInteractionEnabled = YES;
     [_optionView addSubview:lv_antiaircraftView];
     lv_antiaircraftView.tag = 303;
     [self createAntiaircraftViewWithView:lv_antiaircraftView];
     //装甲
     UIView * lv_armouredView = [[UIView alloc]initWithFrame:CGRectMake(-8*X_P, _optionView.frame.size.height*0.45, WIDTH,50*Y_P)];
     lv_armouredView.backgroundColor = [UIColor clearColor];
     lv_armouredView.userInteractionEnabled = YES;
     [_optionView addSubview:lv_armouredView];
     lv_armouredView.tag = 304;
     [self createArmouredViewWithView:lv_armouredView];
     //改造btn
     _lv_up_btn = [AMETools createLvUpButtonWithAble:NO];
     _lv_up_btn.frame = CGRectMake((WIDTH-100*X_P)/2.0, _optionView.frame.size.height*0.45+40*Y_P, 100*X_P, 30*Y_P);
     _lv_up_btn.tag = 310;
     [_lv_up_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:_lv_up_btn];
     
     //道具:损管
     UIView * p_repairView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2.0-35*X_P, _optionView.frame.size.height*0.61, WIDTH/2.0, 40*Y_P)];
     //     p_detectorView.backgroundColor = [UIColor whiteColor];
     [_optionView addSubview:p_repairView];
     p_repairView.tag = 306;
     [self createP_RepairViewWithView:p_repairView];
     
     //道具:飞航队
     UIView * p_aircraftView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2.0-35*X_P, _optionView.frame.size.height*0.72, WIDTH/2.0, 40*Y_P)];
     //     p_detectorView.backgroundColor = [UIColor whiteColor];
     [_optionView addSubview:p_aircraftView];
     p_aircraftView.tag = 308;
     [self createP_AircraftViewWithView:p_aircraftView];
     
     //道具:探测器
     UIView * p_detectorView = [[UIView alloc]initWithFrame:CGRectMake(-10*X_P, _optionView.frame.size.height*0.61, WIDTH/2.0, 40*Y_P)];
//     p_detectorView.backgroundColor = [UIColor whiteColor];
     [_optionView addSubview:p_detectorView];
     p_detectorView.tag = 305;
     [self createP_DetectorViewWithView:p_detectorView];
     
     //道具:雷击组
     UIView * p_torpedoView = [[UIView alloc]initWithFrame:CGRectMake(-10*X_P, _optionView.frame.size.height*0.72, WIDTH/2.0, 40*Y_P)];
     //     p_detectorView.backgroundColor = [UIColor whiteColor];
     [_optionView addSubview:p_torpedoView];
     p_torpedoView.tag = 307;
     [self createP_TorpedoViewWithView:p_torpedoView];
     
     //返回
     UIButton * return_btn = [AMETools createReturnButton];
     return_btn.frame = CGRectMake((WIDTH-120*X_P), _optionView.frame.size.height-55*Y_P, 80*X_P, 35*Y_P);
     return_btn.tag = 311;
     [return_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:return_btn];
     //所有按钮添加事件
     
     _remould_btn_array = [NSMutableArray arrayWithCapacity:10];
     for (UIView * view in _optionView.subviews){
          for (UIView * subview in view.subviews) {
               if ([subview class]==[UIButton class]) {
                    UIButton * btn = (UIButton *)subview;
                    [_remould_btn_array addObject:btn];
                    [btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
               }
          }
     }
     [_remould_btn_array addObject:_lv_up_btn];
     [_remould_btn_array addObject:return_btn];
     //检查一次加减button的状态以及颜色
     [self checkButtonAddAndSubtract];
}


#pragma mark 创建内部可变资源框
- (void)createResourceInsideWithView:(UIView *)resourcesView{
     //钱币
     UIImageView * coin = [[UIImageView alloc]initWithFrame:CGRectMake(0*X_P, 0*Y_P, 18*X_P, 18*Y_P)];
     coin.image = [UIImage imageNamed:@"coin"];
     [resourcesView addSubview:coin];
     
     _coin_lbl_inside = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.coinNum] strokeWidth:2.0 size:17];
     _coin_lbl_inside.frame = CGRectMake(20*X_P, 0*Y_P, 100*X_P, 20*Y_P);
     [resourcesView addSubview:_coin_lbl_inside];
     
     
     //燃料
     UIImageView * s_fuel = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20*Y_P, 17*X_P, 17*Y_P)];
     s_fuel.image = [UIImage imageNamed:@"s_fuel"];
     [resourcesView addSubview:s_fuel];
     
     _fuel_lbl_inside = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.s_fuelNum] strokeWidth:2.0 size:17];
     _fuel_lbl_inside.frame = CGRectMake(20*X_P, 20*Y_P, 30*X_P, 20*Y_P);
     [resourcesView addSubview:_fuel_lbl_inside];
     
     //弹药
     UIImageView * s_ammunition = [[UIImageView alloc]initWithFrame:CGRectMake(50*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     s_ammunition.image = [UIImage imageNamed:@"s_ammunition"];
     [resourcesView addSubview:s_ammunition];
     
     _ammunition_lbl_inside = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.s_ammunitionNum] strokeWidth:2.0 size:17];
     _ammunition_lbl_inside.frame = CGRectMake(70*X_P, 20*Y_P, 30*X_P, 20*Y_P);
     [resourcesView addSubview:_ammunition_lbl_inside];
     
     //铁
     UIImageView * s_steel = [[UIImageView alloc]initWithFrame:CGRectMake(100*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     s_steel.image = [UIImage imageNamed:@"s_steel"];
     [resourcesView addSubview:s_steel];
     
     _steel_lbl_inside = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.s_steelNum] strokeWidth:2.0 size:17];
     _steel_lbl_inside.frame = CGRectMake(120*X_P, 20*Y_P, 30*X_P, 20*Y_P);
     [resourcesView addSubview:_steel_lbl_inside];
     
     //铝
     UIImageView * s_aluminium = [[UIImageView alloc]initWithFrame:CGRectMake(150*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     s_aluminium.image = [UIImage imageNamed:@"s_aluminium"];
     [resourcesView addSubview:s_aluminium];
     
     _aluminium_lbl_inside = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.s_aluminiumNum] strokeWidth:2.0 size:17];
     _aluminium_lbl_inside.frame = CGRectMake(170*X_P, 20*Y_P, 30*X_P, 20*Y_P);
     [resourcesView addSubview:_aluminium_lbl_inside];
}

#pragma mark 创建雷击组View p_torpedoView
- (void)createP_TorpedoViewWithView:(UIView *)p_torpedoView{
     UIImageView * p_torpedo_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     p_torpedo_imgV.image = [UIImage imageNamed:@"p_torpedo"];
     [p_torpedoView addSubview:p_torpedo_imgV];
     
     AMELabel * p_torpedo_des_lbl = [AMETools createAMELabelWithText:@"雷击组" strokeWidth:2.0 size:15.0];
     p_torpedo_des_lbl.alpha = 0.8;
     p_torpedo_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 50*X_P, 25*Y_P);
     p_torpedo_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_torpedoView addSubview:p_torpedo_des_lbl];
     
     //剩余
     _p_torpedo_res_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_torpedoNum] strokeWidth:2.0 size:15.0];
     _p_torpedo_res_lbl.alpha = 0.8;
     _p_torpedo_res_lbl.frame = CGRectMake(WIDTH*0.08+75*X_P, 0, 100*X_P, 25*Y_P);
     _p_torpedo_res_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_torpedoView addSubview:_p_torpedo_res_lbl];
     
     AMELabel * p_torpedo_per_lbl = [AMETools createAMELabelWithText:@"Per:" strokeWidth:2.0 size:15.0];
     p_torpedo_per_lbl.alpha = 0.8;
     p_torpedo_per_lbl.frame = CGRectMake(WIDTH*0.08+20*X_P, 22*Y_P, 50*X_P, 25*Y_P);
     p_torpedo_per_lbl.verticalAlignment = VerticalAlignmentTop;
     [p_torpedoView addSubview:p_torpedo_per_lbl];
     
     UIImageView * p_torpedo_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+50*X_P, 22*Y_P, 17*X_P, 17*Y_P)];
     p_torpedo_s.image = [UIImage imageNamed:@"s_fuel"];
     [p_torpedoView addSubview:p_torpedo_s];
     
     //购买消耗资源
     _p_torpedo_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%d",TORPEDO_COST] strokeWidth:2.0 size:15.0];
     _p_torpedo_sNeed.alpha = 0.8;
     _p_torpedo_sNeed.frame = CGRectMake(WIDTH*0.08+68*X_P, 23*Y_P, 50*X_P, 25*Y_P);
     _p_torpedo_sNeed.verticalAlignment = VerticalAlignmentTop;
     [p_torpedoView addSubview:_p_torpedo_sNeed];
     
     UIButton * p_torpedo_buy = [AMETools createBuyButtonWithAble:[self resourceAvailability:7]];//这里初始状态要用方法判断
     p_torpedo_buy.tag = 3070;
     p_torpedo_buy.frame = CGRectMake(WIDTH*0.08+95*X_P, 20*Y_P, 70*X_P, 25*Y_P);
     [p_torpedoView addSubview:p_torpedo_buy];
}




#pragma mark 创建飞航组View p_aircraftView
- (void)createP_AircraftViewWithView:(UIView *)p_aircraftView{
     UIImageView * p_aircraft_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     p_aircraft_imgV.image = [UIImage imageNamed:@"p_aircraft"];
     [p_aircraftView addSubview:p_aircraft_imgV];
     
     AMELabel * p_aircraft_des_lbl = [AMETools createAMELabelWithText:@"飞航队" strokeWidth:2.0 size:15.0];
     p_aircraft_des_lbl.alpha = 0.8;
     p_aircraft_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 50*X_P, 25*Y_P);
     p_aircraft_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_aircraftView addSubview:p_aircraft_des_lbl];
     
     //剩余
     _p_aircraft_res_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_aircraftNum] strokeWidth:2.0 size:15.0];
     _p_aircraft_res_lbl.alpha = 0.8;
     _p_aircraft_res_lbl.frame = CGRectMake(WIDTH*0.08+75*X_P, 0, 100*X_P, 25*Y_P);
     _p_aircraft_res_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_aircraftView addSubview:_p_aircraft_res_lbl];
     
     AMELabel * p_aircraft_per_lbl = [AMETools createAMELabelWithText:@"Per:" strokeWidth:2.0 size:15.0];
     p_aircraft_per_lbl.alpha = 0.8;
     p_aircraft_per_lbl.frame = CGRectMake(WIDTH*0.08+20*X_P, 22*Y_P, 50*X_P, 25*Y_P);
     p_aircraft_per_lbl.verticalAlignment = VerticalAlignmentTop;
     [p_aircraftView addSubview:p_aircraft_per_lbl];
     
     UIImageView * p_aircraft_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+50*X_P, 22*Y_P, 17*X_P, 17*Y_P)];
     p_aircraft_s.image = [UIImage imageNamed:@"s_fuel"];
     [p_aircraftView addSubview:p_aircraft_s];
     //购买消耗资源
     _p_aircraft_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%d",AIRCRAFT_COST] strokeWidth:2.0 size:15.0];
     _p_aircraft_sNeed.alpha = 0.8;
     _p_aircraft_sNeed.frame = CGRectMake(WIDTH*0.08+68*X_P, 23*Y_P, 50*X_P, 25*Y_P);
     _p_aircraft_sNeed.verticalAlignment = VerticalAlignmentTop;
     [p_aircraftView addSubview:_p_aircraft_sNeed];
     
     UIButton * p_aircraft_buy = [AMETools createBuyButtonWithAble:[self resourceAvailability:8]];//这里初始状态要用方法判断
     p_aircraft_buy.frame = CGRectMake(WIDTH*0.08+95*X_P, 20*Y_P, 70*X_P, 25*Y_P);
     p_aircraft_buy.tag = 3080;
     [p_aircraftView addSubview:p_aircraft_buy];
}




#pragma mark 创建损管View p_repairView
- (void)createP_RepairViewWithView:(UIView *)p_repairView{
     UIImageView * p_repair_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     p_repair_imgV.image = [UIImage imageNamed:@"p_repair"];
     [p_repairView addSubview:p_repair_imgV];
     
     AMELabel * p_repair_des_lbl = [AMETools createAMELabelWithText:@"损管组" strokeWidth:2.0 size:15.0];
     p_repair_des_lbl.alpha = 0.8;
     p_repair_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 50*X_P, 25*Y_P);
     p_repair_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_repairView addSubview:p_repair_des_lbl];
     //剩余
     _p_repair_res_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_repairNum] strokeWidth:2.0 size:15.0];
     _p_repair_res_lbl.alpha = 0.8;
     _p_repair_res_lbl.frame = CGRectMake(WIDTH*0.08+75*X_P, 0, 100*X_P, 25*Y_P);
     _p_repair_res_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_repairView addSubview:_p_repair_res_lbl];
     
     AMELabel * p_repair_per_lbl = [AMETools createAMELabelWithText:@"Per:" strokeWidth:2.0 size:15.0];
     p_repair_per_lbl.alpha = 0.8;
     p_repair_per_lbl.frame = CGRectMake(WIDTH*0.08+20*X_P, 22*Y_P, 50*X_P, 25*Y_P);
     p_repair_per_lbl.verticalAlignment = VerticalAlignmentTop;
     [p_repairView addSubview:p_repair_per_lbl];
     
     UIImageView * p_repair_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+50*X_P, 22*Y_P, 17*X_P, 17*Y_P)];
     p_repair_s.image = [UIImage imageNamed:@"s_fuel"];
     [p_repairView addSubview:p_repair_s];
     //购买消耗
     _p_repair_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%d",REPAIR_COST] strokeWidth:2.0 size:15.0];
     _p_repair_sNeed.alpha = 0.8;
     _p_repair_sNeed.frame = CGRectMake(WIDTH*0.08+68*X_P, 23*Y_P, 50*X_P, 25*Y_P);
     _p_repair_sNeed.verticalAlignment = VerticalAlignmentTop;
     [p_repairView addSubview:_p_repair_sNeed];
     
     UIButton * p_repair_buy = [AMETools createBuyButtonWithAble:[self resourceAvailability:6]];//这里初始状态要用方法判断
     p_repair_buy.frame = CGRectMake(WIDTH*0.08+95*X_P, 20*Y_P, 70*X_P, 25*Y_P);
     p_repair_buy.tag = 3060;
     [p_repairView addSubview:p_repair_buy];
}




#pragma mark 创建探测器View p_detectorView
- (void)createP_DetectorViewWithView:(UIView *)p_detectorView{
     UIImageView * p_detector_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     p_detector_imgV.image = [UIImage imageNamed:@"p_detector"];
     [p_detectorView addSubview:p_detector_imgV];
     
     AMELabel * p_detector_des_lbl = [AMETools createAMELabelWithText:@"探测器" strokeWidth:2.0 size:15.0];
     p_detector_des_lbl.alpha = 0.8;
     p_detector_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 50*X_P, 25*Y_P);
     p_detector_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_detectorView addSubview:p_detector_des_lbl];
     //剩余
     _p_detector_res_lbl = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"Num:%lu",_mainPlayer.p_detectorNum] strokeWidth:2.0 size:15.0];
     _p_detector_res_lbl.alpha = 0.8;
     _p_detector_res_lbl.frame = CGRectMake(WIDTH*0.08+75*X_P, 0, 100*X_P, 25*Y_P);
     _p_detector_res_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [p_detectorView addSubview:_p_detector_res_lbl];
     
     AMELabel * p_detector_per_lbl = [AMETools createAMELabelWithText:@"Per:" strokeWidth:2.0 size:15.0];
     p_detector_per_lbl.alpha = 0.8;
     p_detector_per_lbl.frame = CGRectMake(WIDTH*0.08+20*X_P, 22*Y_P, 50*X_P, 25*Y_P);
     p_detector_per_lbl.verticalAlignment = VerticalAlignmentTop;
     [p_detectorView addSubview:p_detector_per_lbl];
     
     UIImageView * p_detector_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+50*X_P, 22*Y_P, 17*X_P, 17*Y_P)];
     p_detector_s.image = [UIImage imageNamed:@"s_fuel"];
     [p_detectorView addSubview:p_detector_s];
     //消耗资源
     _p_detector_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%d",DETECTOR_COST] strokeWidth:2.0 size:15.0];
     _p_detector_sNeed.alpha = 0.8;
     _p_detector_sNeed.frame = CGRectMake(WIDTH*0.08+68*X_P, 23*Y_P, 50*X_P, 25*Y_P);
     _p_detector_sNeed.verticalAlignment = VerticalAlignmentTop;
     [p_detectorView addSubview:_p_detector_sNeed];
     
     UIButton * p_detector_buy = [AMETools createBuyButtonWithAble:[self resourceAvailability:5]];//这里初始状态要用方法判断
     p_detector_buy.frame = CGRectMake(WIDTH*0.08+95*X_P, 20*Y_P, 70*X_P, 25*Y_P);
     p_detector_buy.tag = 3050;
     [p_detectorView addSubview:p_detector_buy];
}


#pragma RPG计数器主方法-减法
- (void)subtractButtonLvBackWithLine:(NSUInteger)line{
     switch (line) {
          case 1:
          {
               _lv_fire_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_fire_change_lbl.text num:-1];
               _lv_fire_lv.text = [AMETools addOrSubtractWithStr:_lv_fire_lv.text num:-1];
               _lv_fire_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_fire_lv.text integerValue])];
               _lv_fire_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_fire_lv.text integerValue])];
               _ammunition_lbl_inside.text = [AMETools addOrSubtractWithStr:_ammunition_lbl_inside.text num:[_lv_fire_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:[_lv_fire_coinNeed.text integerValue]];
          }break;
          case 2:
          {
               _lv_torpedo_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_torpedo_change_lbl.text num:-1];
               _lv_torpedo_lv.text = [AMETools addOrSubtractWithStr:_lv_torpedo_lv.text num:-1];
               _lv_torpedo_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_torpedo_lv.text integerValue])];
               _lv_torpedo_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_torpedo_lv.text integerValue])];
               _ammunition_lbl_inside.text = [AMETools addOrSubtractWithStr:_ammunition_lbl_inside.text num:[_lv_torpedo_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:[_lv_torpedo_coinNeed.text integerValue]];
               
          }break;
          case 3:
          {
               _lv_antiaircraft_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_antiaircraft_change_lbl.text num:-1];
               _lv_antiaircraft_lv.text = [AMETools addOrSubtractWithStr:_lv_antiaircraft_lv.text num:-1];
               _lv_antiaircraft_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_antiaircraft_lv.text integerValue])];
               _lv_antiaircraft_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_antiaircraft_lv.text integerValue])];
               _aluminium_lbl_inside.text = [AMETools addOrSubtractWithStr:_aluminium_lbl_inside.text num:[_lv_antiaircraft_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:[_lv_antiaircraft_coinNeed.text integerValue]];
               
          }break;
          case 4:
          {
               _lv_armoured_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_armoured_change_lbl.text num:-1];
               _lv_armoured_lv.text = [AMETools addOrSubtractWithStr:_lv_armoured_lv.text num:-1];
               _lv_armoured_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_armoured_lv.text integerValue])];
               _lv_armoured_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_armoured_lv.text integerValue])];
               _steel_lbl_inside.text = [AMETools addOrSubtractWithStr:_steel_lbl_inside.text num:[_lv_armoured_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:[_lv_armoured_coinNeed.text integerValue]];
          }break;
               
     }
     [self checkButtonAddAndSubtract];
     _lv_up_btn.enabled = [self checkLvUpButton];
}




#pragma RPG计数器主方法-加法
- (void)addButtonLvUpWithLine:(NSUInteger)line{
     switch (line) {
          case 1:
          {
               _lv_fire_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_fire_change_lbl.text num:1];
               _ammunition_lbl_inside.text = [AMETools addOrSubtractWithStr:_ammunition_lbl_inside.text num:-[_lv_fire_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:-[_lv_fire_coinNeed.text integerValue]];
               _lv_fire_lv.text = [AMETools addOrSubtractWithStr:_lv_fire_lv.text num:1];
               _lv_fire_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_fire_lv.text integerValue])];
               _lv_fire_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_fire_lv.text integerValue])];
          }break;
          case 2:
          {
               _lv_torpedo_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_torpedo_change_lbl.text num:1];
               _ammunition_lbl_inside.text = [AMETools addOrSubtractWithStr:_ammunition_lbl_inside.text num:-[_lv_torpedo_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:-[_lv_torpedo_coinNeed.text integerValue]];
               _lv_torpedo_lv.text = [AMETools addOrSubtractWithStr:_lv_torpedo_lv.text num:1];
               _lv_torpedo_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_torpedo_lv.text integerValue])];
               _lv_torpedo_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_torpedo_lv.text integerValue])];
               
          }break;
          case 3:
          {
               _lv_antiaircraft_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_antiaircraft_change_lbl.text num:1];
               _aluminium_lbl_inside.text = [AMETools addOrSubtractWithStr:_aluminium_lbl_inside.text num:-[_lv_antiaircraft_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:-[_lv_antiaircraft_coinNeed.text integerValue]];
               _lv_antiaircraft_lv.text = [AMETools addOrSubtractWithStr:_lv_antiaircraft_lv.text num:1];
               _lv_antiaircraft_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_antiaircraft_lv.text integerValue])];
               _lv_antiaircraft_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_antiaircraft_lv.text integerValue])];
          }break;
          case 4:
          {
               _lv_armoured_change_lbl.text = [AMETools addOrSubtractWithStr:_lv_armoured_change_lbl.text num:1];
               _steel_lbl_inside.text = [AMETools addOrSubtractWithStr:_steel_lbl_inside.text num:-[_lv_armoured_sNeed.text integerValue]];
               _coin_lbl_inside.text = [AMETools addOrSubtractWithStr:_coin_lbl_inside.text num:-[_lv_armoured_coinNeed.text integerValue]];
               _lv_armoured_lv.text = [AMETools addOrSubtractWithStr:_lv_armoured_lv.text num:1];
               _lv_armoured_sNeed.text = [NSString stringWithFormat:@"%ld",S_P([_lv_armoured_lv.text integerValue])];
               _lv_armoured_coinNeed.text = [NSString stringWithFormat:@"%ld",C_P([_lv_armoured_lv.text integerValue])];
          }break;

     }
     [self checkButtonAddAndSubtract];
     _lv_up_btn.enabled = [self checkLvUpButton];
}

#pragma mark 判断改造按钮是否可用
- (BOOL)checkLvUpButton{
     BOOL isAble = YES;
     if ([_lv_fire_change_lbl.text integerValue]+[_lv_torpedo_change_lbl.text integerValue]+[_lv_antiaircraft_change_lbl.text integerValue]+[_lv_armoured_change_lbl.text integerValue]==0) {
          isAble  = NO;
     }
     return isAble;
}


#pragma mark 检验所有buyButton
- (void)checkAllBuyButton{
     for (UIView * view in _optionView.subviews) {
          if (view.tag==305||view.tag==306||view.tag==307||view.tag==308){
               for (UIView * view1 in view.subviews) {
                    if ([view1 class]==[UIButton class]) {
                         UIButton * f_btn = (UIButton *)view1;
                              f_btn.enabled = [self resourceAvailability:view.tag-300];
                    }
               }
          }
     }
}

#pragma mark 检验所有加减button的状态 以及颜色
- (void)checkButtonAddAndSubtract{
     for (UIView * view in _optionView.subviews) {
          if (view.tag==301||view.tag==302||view.tag==303||view.tag==304){
               for (UIView * view1 in view.subviews) {
                    if ([view1 class]==[UIButton class]) {
                         UIButton * f_btn = (UIButton *)view1;
                         if (f_btn.tag%2==0) {
                              f_btn.enabled = [self Lvbackable:view.tag-300];
                         }
                         if (f_btn.tag%2) {
                              f_btn.enabled = [self resourceAvailability:view.tag-300];
                         }
                    }
               }
          }
     }
}

#pragma mark 判断向左的降级返回按钮是否可以点击
- (BOOL)Lvbackable:(NSUInteger)line{
     BOOL isNeed = YES;
     switch (line) {
          case 1:
          {
               _lv_fire_sNeed.fillColor = TEXT_GREEN;
               _lv_fire_coinNeed.fillColor = TEXT_GREEN;
               _lv_fire_lv.fillColor = TEXT_GREEN;
               _ammunition_lbl_inside.fillColor = TEXT_GREEN;
               
               if ([_lv_fire_change_lbl.text integerValue]==0){
                    _lv_fire_sNeed.fillColor = [UIColor whiteColor];
                    _lv_fire_coinNeed.fillColor = [UIColor whiteColor];
                    _lv_fire_lv.fillColor = [UIColor whiteColor];
                    //公用资源
                    if ([_lv_torpedo_change_lbl.text integerValue]==0){
                         _ammunition_lbl_inside.fillColor = [UIColor whiteColor];
                    }
                    isNeed = NO;
               }
          }break;
          case 2:
          {
               _lv_torpedo_sNeed.fillColor = TEXT_GREEN;
               _lv_torpedo_coinNeed.fillColor = TEXT_GREEN;
               _lv_torpedo_lv.fillColor = TEXT_GREEN;
               _ammunition_lbl_inside.fillColor = TEXT_GREEN;
               if ([_lv_torpedo_change_lbl.text integerValue]==0){
                    _lv_torpedo_sNeed.fillColor = [UIColor whiteColor];
                    _lv_torpedo_coinNeed.fillColor = [UIColor whiteColor];
                    _lv_torpedo_lv.fillColor = [UIColor whiteColor];
                    //有公用资源
                    if ([_lv_fire_change_lbl.text integerValue]==0) {
                         _ammunition_lbl_inside.fillColor = [UIColor whiteColor];
                    }
                    isNeed = NO;
               }
          }break;
          case 3:
          {
               _lv_antiaircraft_sNeed.fillColor = TEXT_GREEN;
               _lv_antiaircraft_coinNeed.fillColor = TEXT_GREEN;
               _lv_antiaircraft_lv.fillColor = TEXT_GREEN;
               _aluminium_lbl_inside.fillColor = TEXT_GREEN;
               if ([_lv_antiaircraft_change_lbl.text integerValue]==0){
                    _lv_antiaircraft_sNeed.fillColor = [UIColor whiteColor];
                    _lv_antiaircraft_coinNeed.fillColor = [UIColor whiteColor];
                    _lv_antiaircraft_lv.fillColor = [UIColor whiteColor];
                    _aluminium_lbl_inside.fillColor = [UIColor whiteColor];
                    isNeed = NO;
               }
          }break;
          case 4:
          {
               _lv_armoured_sNeed.fillColor = TEXT_GREEN;
               _lv_armoured_coinNeed.fillColor = TEXT_GREEN;
               _lv_armoured_lv.fillColor = TEXT_GREEN;
               _steel_lbl_inside.fillColor = TEXT_GREEN;
               if ([_lv_armoured_change_lbl.text integerValue]==0){
                    _lv_armoured_sNeed.fillColor = [UIColor whiteColor];
                    _lv_armoured_coinNeed.fillColor = [UIColor whiteColor];
                    _lv_armoured_lv.fillColor = [UIColor whiteColor];
                    _steel_lbl_inside.fillColor = [UIColor whiteColor];
                    isNeed = NO;
               }
          }break;
     }
     return isNeed;
}




#pragma mark 判断资源是否够用 是否可以升级
- (BOOL)resourceAvailability:(NSUInteger)line{
     BOOL isNeed = YES;
     switch (line) {
          case 1:
          {
               //对应资源不够 或者等级99 把不符合条件的值变为红色

               if ([_lv_fire_sNeed.text integerValue]>[_ammunition_lbl_inside.text integerValue]){
                    _lv_fire_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_fire_coinNeed.text integerValue]>[_coin_lbl_inside.text integerValue]) {
                    _lv_fire_coinNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_fire_lv.text integerValue]==99) {
                    _lv_fire_lv.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 2:
          {

               if ([_lv_torpedo_sNeed.text integerValue]>[_ammunition_lbl_inside.text integerValue]){
                    _lv_torpedo_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_torpedo_coinNeed.text integerValue]>[_coin_lbl_inside.text integerValue]) {
                    _lv_torpedo_coinNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_torpedo_lv.text integerValue]==99) {
                    _lv_torpedo_lv.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 3:
          {

               if ([_lv_antiaircraft_sNeed.text integerValue]>[_aluminium_lbl_inside.text integerValue]){
                    _lv_antiaircraft_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_antiaircraft_coinNeed.text integerValue]>[_coin_lbl_inside.text integerValue]) {
                    _lv_antiaircraft_coinNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_antiaircraft_lv.text integerValue]==99) {
                    _lv_antiaircraft_lv.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 4:
          {

               if ([_lv_armoured_sNeed.text integerValue]>[_steel_lbl_inside.text integerValue]){
                    _lv_armoured_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_armoured_coinNeed.text integerValue]>[_coin_lbl_inside.text integerValue]) {
                    _lv_armoured_coinNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
               if ([_lv_armoured_lv.text integerValue]==99) {
                    _lv_armoured_lv.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 5:
          {
               _p_detector_sNeed.fillColor = [UIColor whiteColor];
               if ([_p_detector_sNeed.text integerValue]>[_fuel_lbl_inside.text integerValue]){
                    _p_detector_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 6:
          {
               _p_repair_sNeed.fillColor = [UIColor whiteColor];
               if ([_p_repair_sNeed.text integerValue]>[_fuel_lbl_inside.text integerValue]){
                    _p_repair_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 7:
          {
               _p_torpedo_sNeed.fillColor = [UIColor whiteColor];
               if ([_p_torpedo_sNeed.text integerValue]>[_fuel_lbl_inside.text integerValue]){
                    _p_torpedo_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
          case 8:
          {
               _p_aircraft_sNeed.fillColor = [UIColor whiteColor];
               if ([_p_aircraft_sNeed.text integerValue]>[_fuel_lbl_inside.text integerValue]){
                    _p_aircraft_sNeed.fillColor = TEXT_RED;
                    isNeed = NO;
               }
          }break;
     }
     return isNeed;
}


#pragma mark 创建装甲View lv_armouredView
- (void)createArmouredViewWithView:(UIView *)lv_armouredView{
     UIImageView * lv_armoured_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     lv_armoured_imgV.image = [UIImage imageNamed:@"lv_armoured"];
     [lv_armouredView addSubview:lv_armoured_imgV];
     
     AMELabel * lv_armoured_des_lbl = [AMETools createAMELabelWithText:@"装甲:对炮火防御强度  \tLv up need" strokeWidth:2.0 size:13.0];
     lv_armoured_des_lbl.alpha = 0.8;
     lv_armoured_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 220*X_P, 25*Y_P);
     lv_armoured_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [lv_armouredView addSubview:lv_armoured_des_lbl];
     
     AMELabel * lv_armoured_now = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"now Lv"] strokeWidth:2.0 size:15.0];
     lv_armoured_now.alpha = 0.8;
     lv_armoured_now.frame = CGRectMake(WIDTH*0.08+60*X_P, 20*Y_P, 90*X_P, 25*Y_P);
     [lv_armouredView addSubview:lv_armoured_now];
     
     //等级
     _lv_armoured_lv = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.lv_armoured] strokeWidth:2.0 size:15.0];
     _lv_armoured_lv.alpha = 0.8;
     _lv_armoured_lv.frame = CGRectMake(WIDTH*0.08+114*X_P, 20*Y_P, 50*X_P, 25*Y_P);
     [lv_armouredView addSubview:_lv_armoured_lv];
     
     UIImageView * lv_armoured_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+140*X_P, 20*Y_P, 18*X_P, 18*Y_P)];
     lv_armoured_s.image = [UIImage imageNamed:@"s_steel"];
     [lv_armouredView addSubview:lv_armoured_s];
     
     _lv_armoured_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",S_P(_mainPlayer.lv_armoured)] strokeWidth:2.0 size:15.0];
     _lv_armoured_sNeed.alpha = 0.8;
     _lv_armoured_sNeed.frame = CGRectMake(WIDTH*0.08+160*X_P, 20*Y_P, 30*X_P, 18*Y_P);
     [lv_armouredView addSubview:_lv_armoured_sNeed];
     
     UIImageView * lv_armoured_coin = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+190*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     lv_armoured_coin.image = [UIImage imageNamed:@"coin"];
     [lv_armouredView addSubview:lv_armoured_coin];
     
     _lv_armoured_coinNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",C_P(_mainPlayer.lv_armoured)] strokeWidth:2.0 size:15.0];
     _lv_armoured_coinNeed.alpha = 0.8;
     _lv_armoured_coinNeed.frame = CGRectMake(WIDTH*0.08+210*X_P, 20*Y_P, 45*X_P, 18*Y_P);
     [lv_armouredView addSubview:_lv_armoured_coinNeed];
     
     UIButton * lv_armoured_subtract = [AMETools createLeftButtonWithAble:NO];
     lv_armoured_subtract.alpha = 0.6;
     lv_armoured_subtract.frame = CGRectMake(WIDTH*0.08+255*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     lv_armoured_subtract.tag = 3040;
     [lv_armouredView addSubview:lv_armoured_subtract];
     
     _lv_armoured_change_lbl = [AMETools createAMELabelWithText:@"0" strokeWidth:2.0 size:16.0];
     _lv_armoured_change_lbl.alpha = 0.8;
     _lv_armoured_change_lbl.verticalAlignment = VerticalAlignmentMiddle;
     _lv_armoured_change_lbl.textAlignment = NSTextAlignmentCenter;
     _lv_armoured_change_lbl.frame = CGRectMake(WIDTH*0.08+278*X_P, 10*Y_P, 24*X_P, 24*Y_P);
     [lv_armouredView addSubview:_lv_armoured_change_lbl];
     
     UIButton * lv_armoured_add = [AMETools createRightButtonWithAble:[self resourceAvailability:4]];
     lv_armoured_add.alpha = 0.6;
     lv_armoured_add.tag = 3041;
     lv_armoured_add.frame = CGRectMake(WIDTH*0.08+300*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     [lv_armouredView addSubview:lv_armoured_add];
}


#pragma mark 创建防空View lv_antiaircraftView
- (void)createAntiaircraftViewWithView:(UIView *)lv_antiaircraftView{
     UIImageView * lv_antiaircraft_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     lv_antiaircraft_imgV.image = [UIImage imageNamed:@"lv_antiaircraft"];
     [lv_antiaircraftView addSubview:lv_antiaircraft_imgV];
     
     AMELabel * lv_antiaircraft_des_lbl = [AMETools createAMELabelWithText:@"防空:对敌机防御强度  \tLv up need" strokeWidth:2.0 size:13.0];
     lv_antiaircraft_des_lbl.alpha = 0.8;
     lv_antiaircraft_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 220*X_P, 25*Y_P);
     lv_antiaircraft_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [lv_antiaircraftView addSubview:lv_antiaircraft_des_lbl];
     
     AMELabel * lv_antiaircraft_now = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"now Lv"] strokeWidth:2.0 size:15.0];
     lv_antiaircraft_now.alpha = 0.8;
     lv_antiaircraft_now.frame = CGRectMake(WIDTH*0.08+60*X_P, 20*Y_P, 90*X_P, 25*Y_P);
     [lv_antiaircraftView addSubview:lv_antiaircraft_now];
     
     //等级
     _lv_antiaircraft_lv = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.lv_antiaircraft] strokeWidth:2.0 size:15.0];
     _lv_antiaircraft_lv.alpha = 0.8;
     _lv_antiaircraft_lv.frame = CGRectMake(WIDTH*0.08+114*X_P, 20*Y_P, 50*X_P, 25*Y_P);
     [lv_antiaircraftView addSubview:_lv_antiaircraft_lv];
     
     UIImageView * lv_antiaircraft_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+140*X_P, 20*Y_P, 18*X_P, 18*Y_P)];
     lv_antiaircraft_s.image = [UIImage imageNamed:@"s_aluminium"];
     [lv_antiaircraftView addSubview:lv_antiaircraft_s];
     //消耗资源
     _lv_antiaircraft_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",S_P(_mainPlayer.lv_antiaircraft)] strokeWidth:2.0 size:15.0];
     _lv_antiaircraft_sNeed.alpha = 0.8;
     _lv_antiaircraft_sNeed.frame = CGRectMake(WIDTH*0.08+160*X_P, 20*Y_P, 30*X_P, 18*Y_P);
     [lv_antiaircraftView addSubview:_lv_antiaircraft_sNeed];
     //消耗金币
     UIImageView * lv_antiaircraft_coin = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+190*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     lv_antiaircraft_coin.image = [UIImage imageNamed:@"coin"];
     [lv_antiaircraftView addSubview:lv_antiaircraft_coin];
     
     _lv_antiaircraft_coinNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",C_P(_mainPlayer.lv_antiaircraft)] strokeWidth:2.0 size:15.0];
     _lv_antiaircraft_coinNeed.alpha = 0.8;
     _lv_antiaircraft_coinNeed.frame = CGRectMake(WIDTH*0.08+210*X_P, 20*Y_P, 45*X_P, 18*Y_P);
     [lv_antiaircraftView addSubview:_lv_antiaircraft_coinNeed];
     
     UIButton * lv_antiaircraft_subtract = [AMETools createLeftButtonWithAble:NO];
     lv_antiaircraft_subtract.alpha = 0.6;
     lv_antiaircraft_subtract.frame = CGRectMake(WIDTH*0.08+255*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     lv_antiaircraft_subtract.tag = 3030;
     [lv_antiaircraftView addSubview:lv_antiaircraft_subtract];
     
     _lv_antiaircraft_change_lbl = [AMETools createAMELabelWithText:@"0" strokeWidth:2.0 size:16.0];
     _lv_antiaircraft_change_lbl.alpha = 0.8;
     _lv_antiaircraft_change_lbl.verticalAlignment = VerticalAlignmentMiddle;
     _lv_antiaircraft_change_lbl.textAlignment = NSTextAlignmentCenter;
     _lv_antiaircraft_change_lbl.frame = CGRectMake(WIDTH*0.08+278*X_P, 10*Y_P, 24*X_P, 24*Y_P);
     [lv_antiaircraftView addSubview:_lv_antiaircraft_change_lbl];
     
     UIButton * lv_antiaircraft_add = [AMETools createRightButtonWithAble:[self resourceAvailability:3]];
     lv_antiaircraft_add.alpha = 0.6;
     lv_antiaircraft_add.tag = 3031;
     lv_antiaircraft_add.frame = CGRectMake(WIDTH*0.08+300*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     [lv_antiaircraftView addSubview:lv_antiaircraft_add];
}



#pragma mark 创建鱼雷View lv_torpedoView
- (void)createTorpedoViewWithView:(UIView *)lv_torpedoView{
     UIImageView * lv_torpedo_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     lv_torpedo_imgV.image = [UIImage imageNamed:@"lv_torpedo"];
     [lv_torpedoView addSubview:lv_torpedo_imgV];
     
     AMELabel * lv_torpedo_des_lbl = [AMETools createAMELabelWithText:@"鱼雷:鱼雷攻击的强度  \tLv up need" strokeWidth:2.0 size:13.0];
     lv_torpedo_des_lbl.alpha = 0.8;
     lv_torpedo_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 220*X_P, 25*Y_P);
     lv_torpedo_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [lv_torpedoView addSubview:lv_torpedo_des_lbl];
     
     AMELabel * lv_torpedo_now = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"now Lv"] strokeWidth:2.0 size:15.0];
     lv_torpedo_now.alpha = 0.8;
     lv_torpedo_now.frame = CGRectMake(WIDTH*0.08+60*X_P, 20*Y_P, 90*X_P, 25*Y_P);
     [lv_torpedoView addSubview:lv_torpedo_now];
     
     //等级
     _lv_torpedo_lv = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.lv_torpedo] strokeWidth:2.0 size:15.0];
     _lv_torpedo_lv.alpha = 0.8;
     _lv_torpedo_lv.frame = CGRectMake(WIDTH*0.08+114*X_P, 20*Y_P, 50*X_P, 25*Y_P);
     [lv_torpedoView addSubview:_lv_torpedo_lv];
     
     UIImageView * lv_torpedo_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+140*X_P, 20*Y_P, 18*X_P, 18*Y_P)];
     lv_torpedo_s.image = [UIImage imageNamed:@"s_ammunition"];
     [lv_torpedoView addSubview:lv_torpedo_s];
     
     _lv_torpedo_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",S_P(_mainPlayer.lv_torpedo)] strokeWidth:2.0 size:15.0];
     _lv_torpedo_sNeed.alpha = 0.8;
     _lv_torpedo_sNeed.frame = CGRectMake(WIDTH*0.08+160*X_P, 20*Y_P, 30*X_P, 18*Y_P);
     [lv_torpedoView addSubview:_lv_torpedo_sNeed];
     
     UIImageView * lv_torpedo_coin = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+190*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     lv_torpedo_coin.image = [UIImage imageNamed:@"coin"];
     [lv_torpedoView addSubview:lv_torpedo_coin];
     
     _lv_torpedo_coinNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",C_P(_mainPlayer.lv_torpedo)] strokeWidth:2.0 size:15.0];
     _lv_torpedo_coinNeed.alpha = 0.8;
     _lv_torpedo_coinNeed.frame = CGRectMake(WIDTH*0.08+210*X_P, 20*Y_P, 45*X_P, 18*Y_P);
     [lv_torpedoView addSubview:_lv_torpedo_coinNeed];
     
     UIButton * lv_torpedo_subtract = [AMETools createLeftButtonWithAble:NO];
     lv_torpedo_subtract.alpha = 0.6;
     lv_torpedo_subtract.frame = CGRectMake(WIDTH*0.08+255*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     lv_torpedo_subtract.tag = 3020;
     [lv_torpedoView addSubview:lv_torpedo_subtract];
     
     _lv_torpedo_change_lbl = [AMETools createAMELabelWithText:@"0" strokeWidth:2.0 size:16.0];
     _lv_torpedo_change_lbl.alpha = 0.8;
     _lv_torpedo_change_lbl.verticalAlignment = VerticalAlignmentMiddle;
     _lv_torpedo_change_lbl.textAlignment = NSTextAlignmentCenter;
     _lv_torpedo_change_lbl.frame = CGRectMake(WIDTH*0.08+278*X_P, 10*Y_P, 24*X_P, 24*Y_P);
     [lv_torpedoView addSubview:_lv_torpedo_change_lbl];
     
     UIButton * lv_torpedo_add = [AMETools createRightButtonWithAble:[self resourceAvailability:2]];
     lv_torpedo_add.alpha = 0.6;
     lv_torpedo_add.tag = 3021;
     lv_torpedo_add.frame = CGRectMake(WIDTH*0.08+300*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     [lv_torpedoView addSubview:lv_torpedo_add];
}



#pragma mark 创建火力View lv_fireView
- (void)createFireViewWithView:(UIView *)lv_fireView{
     UIImageView * lv_fire_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08, 0, 23*X_P, 23*Y_P)];
     lv_fire_imgV.image = [UIImage imageNamed:@"lv_fire"];
     [lv_fireView addSubview:lv_fire_imgV];
     
     AMELabel * lv_fire_des_lbl = [AMETools createAMELabelWithText:@"火力:普通攻击的强度  \tLv up need" strokeWidth:2.0 size:13.0];
     lv_fire_des_lbl.alpha = 0.8;
     lv_fire_des_lbl.frame = CGRectMake(WIDTH*0.08+25*X_P, 0, 220*X_P, 25*Y_P);
     lv_fire_des_lbl.verticalAlignment = VerticalAlignmentMiddle;
     [lv_fireView addSubview:lv_fire_des_lbl];
     
     AMELabel * lv_fire_now = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"now Lv"] strokeWidth:2.0 size:15.0];
     lv_fire_now.alpha = 0.8;
     lv_fire_now.frame = CGRectMake(WIDTH*0.08+60*X_P, 20*Y_P, 90*X_P, 25*Y_P);
     [lv_fireView addSubview:lv_fire_now];
     
     //等级
     _lv_fire_lv = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",_mainPlayer.lv_fire] strokeWidth:2.0 size:15.0];
     _lv_fire_lv.alpha = 0.8;
     _lv_fire_lv.frame = CGRectMake(WIDTH*0.08+114*X_P, 20*Y_P, 50*X_P, 25*Y_P);
     [lv_fireView addSubview:_lv_fire_lv];
     
     UIImageView * lv_fire_s = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+140*X_P, 20*Y_P, 18*X_P, 18*Y_P)];
     lv_fire_s.image = [UIImage imageNamed:@"s_ammunition"];
     [lv_fireView addSubview:lv_fire_s];
     
     _lv_fire_sNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",S_P(_mainPlayer.lv_fire)] strokeWidth:2.0 size:15.0];
     _lv_fire_sNeed.alpha = 0.8;
     _lv_fire_sNeed.frame = CGRectMake(WIDTH*0.08+160*X_P, 20*Y_P, 30*X_P, 18*Y_P);
     [lv_fireView addSubview:_lv_fire_sNeed];
     
     UIImageView * lv_fire_coin = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.08+190*X_P, 20*Y_P, 17*X_P, 17*Y_P)];
     lv_fire_coin.image = [UIImage imageNamed:@"coin"];
     [lv_fireView addSubview:lv_fire_coin];
     
     _lv_fire_coinNeed = [AMETools createAMELabelWithText:[NSString stringWithFormat:@"%lu",C_P(_mainPlayer.lv_fire)] strokeWidth:2.0 size:15.0];
     _lv_fire_coinNeed.alpha = 0.8;
     _lv_fire_coinNeed.frame = CGRectMake(WIDTH*0.08+210*X_P, 20*Y_P, 45*X_P, 18*Y_P);
     [lv_fireView addSubview:_lv_fire_coinNeed];
     
     UIButton * lv_fire_subtract = [AMETools createLeftButtonWithAble:NO];
     lv_fire_subtract.alpha = 0.6;
     lv_fire_subtract.frame = CGRectMake(WIDTH*0.08+255*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     lv_fire_subtract.tag = 3010;
     [lv_fireView addSubview:lv_fire_subtract];
     
     _lv_fire_change_lbl = [AMETools createAMELabelWithText:@"0" strokeWidth:2.0 size:16.0];
     _lv_fire_change_lbl.alpha = 0.8;
     _lv_fire_change_lbl.verticalAlignment = VerticalAlignmentMiddle;
     _lv_fire_change_lbl.textAlignment = NSTextAlignmentCenter;
     _lv_fire_change_lbl.frame = CGRectMake(WIDTH*0.08+278*X_P, 10*Y_P, 24*X_P, 24*Y_P);
     [lv_fireView addSubview:_lv_fire_change_lbl];
     
     UIButton * lv_fire_add = [AMETools createRightButtonWithAble:[self resourceAvailability:1]];
     lv_fire_add.alpha = 0.6;
     lv_fire_add.tag = 3011;
     lv_fire_add.frame = CGRectMake(WIDTH*0.08+300*X_P, 10*Y_P, 26*X_P, 26*Y_P);
     [lv_fireView addSubview:lv_fire_add];
}

#pragma mark 创建optionView
- (void)createOptionView{
     _text_lbl.text = @"游戏的设置页面";
     [_text_lbl startAnime];
     //开启事件响应
     _optionView.userInteractionEnabled = YES;

     //标题
     AMELabel * optionMain_lbl = [AMETools createAMELabelWithText:@"设置" strokeWidth:3.0 size:25.0];
     optionMain_lbl.frame = CGRectMake(0, 0, WIDTH, 25*Y_P);
     optionMain_lbl.alpha = 0.8;
     optionMain_lbl.textAlignment = NSTextAlignmentCenter;
     [_optionView addSubview:optionMain_lbl];

     //BGM播放
     AMELabel * option_bgm_lbl = [AMETools createAMELabelWithText:@"BGM播放" strokeWidth:3.0 size:20.0];
     option_bgm_lbl.frame = CGRectMake(WIDTH*0.23, _optionView.frame.size.height*0.3, 100*X_P, 30*Y_P);
     option_bgm_lbl.alpha = 0.8;
     [_optionView addSubview:option_bgm_lbl];
     UIButton * option_bgm_btn = [AMETools createSwitchButtonWithSelected:YES];//以后要改成用户设置
//     option_bgm_btn.frame = CGRectMake(WIDTH*0.53, _optionView.frame.size.height*0.3-20*Y_P, 120*X_P, 50*Y_P);
     option_bgm_btn.frame = CGRectMake(WIDTH*0.53+25*X_P, _optionView.frame.size.height*0.3-8*Y_P, 73*X_P, 26*Y_P);
     option_bgm_btn.selected = _mainPlayer.bgmOpen;
     option_bgm_btn.tag = 201;
     [option_bgm_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:option_bgm_btn];

     //SE播放
     AMELabel * option_se_lbl = [AMETools createAMELabelWithText:@"SE播放" strokeWidth:3.0 size:20.0];
     option_se_lbl.frame = CGRectMake(WIDTH*0.23, _optionView.frame.size.height*0.42, 120*X_P, 50*Y_P);
     option_se_lbl.alpha = 0.8;
     [_optionView addSubview:option_se_lbl];
     UIButton * option_se_btn = [AMETools createSwitchButtonWithSelected:YES];//以后要改成用户设置
//     option_se_btn.frame = CGRectMake(WIDTH*0.53, _optionView.frame.size.height*0.42-20*Y_P, 120*X_P, 50*Y_P);
     option_se_btn.frame = CGRectMake(WIDTH*0.53+25*X_P, _optionView.frame.size.height*0.42-8*Y_P, 73*X_P, 26*Y_P);
     option_se_btn.tag = 202;
     option_se_btn.selected = _mainPlayer.seOpen;
     [option_se_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:option_se_btn];

     //提督名修改
     AMELabel * option_name_lbl = [AMETools createAMELabelWithText:@"提督名更改" strokeWidth:3.0 size:20.0];
     option_name_lbl.frame = CGRectMake(WIDTH*0.23, _optionView.frame.size.height*0.54, 120*X_P, 50*Y_P);
     option_name_lbl.alpha = 0.8;
     [_optionView addSubview:option_name_lbl];
     UIButton * option_name_btn = [AMETools createChangeButtonWithAble:YES];//以后要改成用户设置
     option_name_btn.frame = CGRectMake(WIDTH*0.53+25*X_P, _optionView.frame.size.height*0.54-8*Y_P, 73*X_P, 26*Y_P);
     option_name_btn.tag = 203;
     [option_name_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:option_name_btn];

     //主页舰娘
     AMELabel * option_mainWSG_lbl = [AMETools createAMELabelWithText:@"主页舰娘" strokeWidth:3.0 size:20.0];
     option_mainWSG_lbl.frame = CGRectMake(WIDTH*0.23, _optionView.frame.size.height*0.66, 120*X_P, 50*Y_P);
     option_mainWSG_lbl.alpha = 0.8;
     [_optionView addSubview:option_mainWSG_lbl];
     UIButton * option_mainWSG_btn = [AMETools createChangeButtonWithAble:YES];//以后要改成用户设置
     option_mainWSG_btn.frame = CGRectMake(WIDTH*0.53+25*X_P, _optionView.frame.size.height*0.66-8*Y_P, 73*X_P, 26*Y_P);
     option_mainWSG_btn.tag = 204;
     [option_mainWSG_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:option_mainWSG_btn];

     //返回 tag默认999
     UIButton * option_done_btn = [AMETools createReturnButton];
     option_done_btn.frame = CGRectMake((WIDTH-80*X_P)/2.0, _optionView.frame.size.height-90*Y_P, 80*X_P, 35*Y_P);
     option_done_btn.tag = 205;
     [option_done_btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
     [_optionView addSubview:option_done_btn];
     _option_btn_array = [NSMutableArray arrayWithCapacity:5];
     for (UIView * view in _optionView.subviews) {
          if ([view class]==[UIButton class]) {
               [_option_btn_array addObject:view];
          }
     }
}


#pragma mark 设置button组是否交互
- (void)makeUIControlAble:(BOOL)isAble Array:(NSArray *) array{
    for (UIControl * uc in array) {
        uc.enabled = isAble;
    }
}

- (void)createCharacter{    
    _character = [[UIImageView alloc]init];
    _character.frame = CGRectMake(0, 0, WIDTH*0.7 ,HEIGHT*0.75);
    _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",_mainPlayer.indexWSG ]];
    [self.view addSubview:_character];
}

- (NSString *)getCharacterString{
     switch (_mainPlayer.indexWSG) {
          case SHIMAKAZE:return @"岛风";
          case YAMATO:return @"大和";
          case KONGOU:return @"金刚";
     }
}

- (void)createDialogBox{
    //dialogBox = [[UIImageView alloc]initWithFrame:CGRectMake(0, HEIGHT-HEIGHT*0.3, WIDTH, HEIGHT*0.3)];
    
    _dialogBox = [[UIImageView alloc]init];
    _dialogBox.frame = CGRectMake(0, 0, WIDTH, HEIGHT*0.3);
    _dialogBox.image = [UIImage imageNamed:@"dialog_box"];
    _dialogBox.alpha = 0.8;
    [self.view addSubview:_dialogBox];
    
    _dialogTilte_lbl = [[AMELabel alloc]initWithFrame:CGRectMake(WIDTH-135*X_P, 7*Y_P, 130*X_P, 50*Y_P)];
    _dialogTilte_lbl.text = [self getCharacterString];
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

}
- (void)createButtonView{
    //buttonView = [[UIView alloc]initWithFrame:CGRectMake(10*X_P, HEIGHT*0.25, 110*X_P, HEIGHT*(1-0.25-0.3))];
    
    _buttonView = [[UIView alloc]init];
    
    //给一个大小值 不然后面的东西可能会用
    _buttonView.frame = CGRectMake(0, 0, 110*X_P, HEIGHT*(1-0.25-0.3));

    _buttonView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_buttonView];
    
    _level_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_level_btn setImage:[UIImage imageNamed:@"level_btn"] forState:UIControlStateNormal];
    _level_btn.frame = CGRectMake(0, 0, 110*X_P, 110/180.0*78*Y_P);
    _level_btn.tag = 101;
    [_buttonView addSubview:_level_btn];
    
    _save_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_save_btn setImage:[UIImage imageNamed:@"save_btn"] forState:UIControlStateNormal];
    _save_btn.frame = CGRectMake(0, _buttonView.frame.size.height*0.2, 110*X_P, 110/180.0*78*Y_P);
    _save_btn.tag = 102;
    [_buttonView addSubview:_save_btn];
    
    _load_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_load_btn setImage:[UIImage imageNamed:@"load_btn"] forState:UIControlStateNormal];
    _load_btn.frame = CGRectMake(0, _buttonView.frame.size.height*0.4, 110*X_P, 110/180.0*78*Y_P);
    _load_btn.tag = 103;
    [_buttonView addSubview:_load_btn];
    
    _remould_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_remould_btn setImage:[UIImage imageNamed:@"remould_btn"] forState:UIControlStateNormal];
    _remould_btn.frame = CGRectMake(0, _buttonView.frame.size.height*0.6, 110*X_P, 110/224.0*90*Y_P);
    _remould_btn.tag = 104;
    [_buttonView addSubview:_remould_btn];
    
    _seting_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_seting_btn setImage:[UIImage imageNamed:@"seting_btn"] forState:UIControlStateNormal];
    _seting_btn.frame = CGRectMake(0, _buttonView.frame.size.height*0.8, 110*X_P, 110/224.0*90*Y_P);
    _seting_btn.tag = 105;
    [_buttonView addSubview:_seting_btn];
}

- (void)createTopBox{
    _top_box = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.06)];
    _top_box.image = [UIImage imageNamed:@"top_box"];
    [self.view addSubview:_top_box];
}




- (void)createResourcesView{
     //resourcesView = [[UIView alloc]initWithFrame:CGRectMake(5*X_P, HEIGHT*0.06+2, 200*X_P, 40*Y_P)];
     _resourcesView = [[UIView alloc]init];

     //给一个大小值 不然后面的东西可能会用
     _resourcesView.frame = CGRectMake(0, 0, 200*X_P, 40*Y_P);
     _resourcesView.backgroundColor = [UIColor clearColor];
     [self.view addSubview:_resourcesView];
     //燃料
     UIImageView * s_fuel = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 17*X_P, 17*Y_P)];
     s_fuel.image = [UIImage imageNamed:@"s_fuel"];
     [_resourcesView addSubview:s_fuel];
     
     _fuel_lbl = [[UILabel alloc]initWithFrame:CGRectMake(20*X_P, 0, 30*X_P, 20*Y_P)];
     _fuel_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.s_fuelNum];
     _fuel_lbl.textColor = [UIColor whiteColor];
     _fuel_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:16*X_P];
     [_resourcesView addSubview:_fuel_lbl];
     //弹药
     UIImageView * s_ammunition = [[UIImageView alloc]initWithFrame:CGRectMake(50*X_P, 0, 17*X_P, 17*Y_P)];
     s_ammunition.image = [UIImage imageNamed:@"s_ammunition"];
     [_resourcesView addSubview:s_ammunition];
     _ammunition_lbl = [[UILabel alloc]initWithFrame:CGRectMake(70*X_P, 0, 30*X_P, 20*Y_P)];
     _ammunition_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.s_ammunitionNum];
     _ammunition_lbl.textColor = [UIColor whiteColor];
     _ammunition_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:16*X_P];
     [_resourcesView addSubview:_ammunition_lbl];
     //铁
     UIImageView * s_steel = [[UIImageView alloc]initWithFrame:CGRectMake(100*X_P, 0, 17*X_P, 17*Y_P)];
     s_steel.image = [UIImage imageNamed:@"s_steel"];
     [_resourcesView addSubview:s_steel];
     _steel_lbl = [[UILabel alloc]initWithFrame:CGRectMake(120*X_P, 0, 30*X_P, 20*Y_P)];
     _steel_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.s_steelNum];
     _steel_lbl.textColor = [UIColor whiteColor];
     _steel_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:16*X_P];
     [_resourcesView addSubview:_steel_lbl];
     //铝
     UIImageView * s_aluminium = [[UIImageView alloc]initWithFrame:CGRectMake(150*X_P, 0, 17*X_P, 17*Y_P)];
     s_aluminium.image = [UIImage imageNamed:@"s_aluminium"];
     [_resourcesView addSubview:s_aluminium];
     _aluminium_lbl = [[UILabel alloc]initWithFrame:CGRectMake(170*X_P, 0, 30*X_P, 20*Y_P)];
     _aluminium_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.s_aluminiumNum];
     _aluminium_lbl.textColor = [UIColor whiteColor];
     _aluminium_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:16*X_P];
     [_resourcesView addSubview:_aluminium_lbl];
     //钱币
     UIImageView * coin = [[UIImageView alloc]initWithFrame:CGRectMake(0*X_P, 20*Y_P, 18*X_P, 18*Y_P)];
     coin.image = [UIImage imageNamed:@"coin"];
     [_resourcesView addSubview:coin];
     _coin_lbl = [[UILabel alloc]initWithFrame:CGRectMake(21*X_P, 20*Y_P, 100*X_P, 20*Y_P)];
     _coin_lbl.text = [NSString stringWithFormat:@"%lu",_mainPlayer.coinNum];
     _coin_lbl.textColor = [UIColor whiteColor];
     _coin_lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:16*X_P];
     [_resourcesView addSubview:_coin_lbl];

}



#pragma mark 主界面的各种部件移出屏幕
- (void)mainViewsInitFrame{
     _character.frame = CGRectMake(WIDTH+WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
     _dialogBox.frame = CGRectMake(0, HEIGHT+HEIGHT*0.3, WIDTH, HEIGHT*0.3);
     _buttonView.frame = CGRectMake(-110*X_P, HEIGHT*0.25, 110*X_P, HEIGHT*(1-0.25-0.3));
     _resourcesView.frame = CGRectMake(-200*X_P, HEIGHT*0.06+2, 200*X_P, 40*Y_P);
}

#pragma mark 主界面的各种部件归位
- (void)mainViewsGetPosition{
     _character.frame = CGRectMake(WIDTH-WIDTH*0.7, HEIGHT-HEIGHT*0.85, WIDTH*0.7 ,HEIGHT*0.75);
     _dialogBox.frame = CGRectMake(0, HEIGHT-HEIGHT*0.3, WIDTH, HEIGHT*0.3);
     _buttonView.frame = CGRectMake(10*X_P, HEIGHT*0.25, 110*X_P, HEIGHT*(1-0.25-0.3));
     _resourcesView.frame = CGRectMake(5*X_P, HEIGHT*0.06+2, 200*X_P, 40*Y_P);
}

#pragma mark 要跳转到这个页面时 各种部件移出屏幕 并读取存档
- (void)viewWillAppear:(BOOL)animated{
     [super viewWillAppear:animated];
     isShow = YES;
     _bgmPlayer = [AMETools getMP3PlayerWithFileName:@"bgm_index" RuntimeCount:0];
     [self mainViewsInitFrame];
     [self loadTheSaves];
}

- (void)beginGame{
     //第一次运行游戏 或者新生成存档 执行if的时候 player已经load到数据了
     if (![self loadIndexSave]) {
          _text_lbl.text = @"没有检测到存档,或者您开始了新游戏,请输入你的提督名";
          [_text_lbl startAnime];
          [self createNoticeBoxWithImage:[UIImage imageNamed:@"notice_box"] rect:CGRectMake(20*X_P, 200*Y_P, WIDTH-40*X_P, 200*Y_P) makeDisAbleArray:_buttonView.subviews next:^{
               [self createNameChangeNotice:YES];
          }];
     }else{
          _text_lbl.text = @"欢迎回来,提督!";
          [_text_lbl startAnime];
     }
     _coin_lbl.text = [NSString stringWithFormat:@"%lu",[self saveIndex:_lastSave].coinNum];
     _aluminium_lbl.text = [NSString stringWithFormat:@"%lu",[self saveIndex:_lastSave].s_aluminiumNum];
     _steel_lbl.text = [NSString stringWithFormat:@"%lu",[self saveIndex:_lastSave].s_steelNum];
     _ammunition_lbl.text = [NSString stringWithFormat:@"%lu",[self saveIndex:_lastSave].s_ammunitionNum];
     _fuel_lbl.text = [NSString stringWithFormat:@"%lu",[self saveIndex:_lastSave].s_fuelNum];
}



#pragma mark 页面读取完毕后 开始动画
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self loadIndexSave];
     _character.image = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"c%lu",[self saveIndex:_lastSave].indexWSG]];
     _dialogTilte_lbl.text = [self getCharacterString];
   [UIView animateWithDuration:1 animations:^{
       [self mainViewsGetPosition];
        if (_mainPlayer.bgmOpen) {
             [_bgmPlayer play];
        }
   } completion:^(BOOL finished) {
        //第一次运行游戏 或者新生成存档
        [self beginGame];
       //为5个按钮添加事件
       for (UIButton * btn in _buttonView.subviews) {
           [btn addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
       }
   }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)home{
     if (isShow) {
         [_bgmPlayer stop];
     }
}
- (void)back{
     if (_mainPlayer.bgmOpen&&isShow) {
          [_bgmPlayer play];
     }
}

- (void)viewWillDisappear:(BOOL)animated{
     [_bgmPlayer stop];
     isShow = NO;
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
