//
//  welcomeViewController.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/5/31.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "welcomeViewController.h"
#import "IndexViewController.h"
#import "AMETools.h"


@interface welcomeViewController ()
{
    AVAudioPlayer * _player;
}

@end

@implementation welcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%lf",WIDTH);
    NSLog(@"%lf",HEIGHT);
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(home) name:@"home" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(back) name:@"back" object:nil];
    
    float logoY;
    if (HEIGHT<500) {
        logoY = 130;
    }else{
        logoY = 170*Y_P;
    }
    
    AMESave * save = [AMESave new];
    [save loadWithIndex:[[[NSUserDefaults standardUserDefaults]objectForKey:@"lastSave"] integerValue]];
    if (save.bgmOpen) {
        _player = [AMETools getMP3PlayerWithFileName:@"bgm_gameStart" RuntimeCount:0];
        [_player play];
    }
    
    //创建背景层
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIImageView * bg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bg.image = [AMETools getPNGImageWithName:@"bg"];
    [self.view addSubview:bg];
    
    //logo右半部分放到屏幕外
    UIImageView * logo_right = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH, logoY, WIDTH*0.8 , WIDTH*0.8/871.0*430)];
    logo_right.image = [AMETools getPNGImageWithName:@"logo_right"];
    [self.view addSubview:logo_right];
    //logo左半部分放到屏幕外
    UIImageView * logo_left = [[UIImageView alloc]initWithFrame:CGRectMake(0-WIDTH*0.8, logoY, WIDTH*0.8, WIDTH*0.8/871.0*430)];
    logo_left.image = [AMETools getPNGImageWithName:@"logo_left"];
    [self.view addSubview:logo_left];
    //创建GAME START 并把初始透明度赋为0
    UIButton * start_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    start_btn.frame = CGRectMake((WIDTH-WIDTH*0.4)/2.0, 400*Y_P, WIDTH*0.4, WIDTH*0.4*0.3);
    [start_btn setImage:[AMETools getPNGImageWithName:@"startButton"] forState:UIControlStateNormal];
    start_btn.alpha = 0;
    [self.view addSubview:start_btn];
    //创建以及作者版本信息标签 初始透明度为0
    UILabel * versions_lbl = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-WIDTH*0.7)/2.0, HEIGHT-100, WIDTH*0.7, 80)];
    versions_lbl.text = @"WarShipGirlsFinding\n By AME & CZ\n Team YOKOSUKA Port";
    versions_lbl.textAlignment = NSTextAlignmentCenter;
    versions_lbl.numberOfLines = 3;
    versions_lbl.alpha = 0;
    [self.view addSubview:versions_lbl];
    
    //动画开始
    [UIImageView animateWithDuration:1 animations:^{
        //把左logo和右logo移动到中间
        logo_right.frame = CGRectMake((WIDTH-WIDTH*0.8)/2.0, logoY, WIDTH*0.8, WIDTH*0.8/871.0*430);
        logo_left.frame = CGRectMake((WIDTH-WIDTH*0.8)/2.0, logoY, WIDTH*0.8, WIDTH*0.8/871.0*430);
    } completion:^(BOOL finished) {
        //移除左右
        [logo_left removeFromSuperview];
        [logo_right removeFromSuperview];
        //添加一个完成的Logo层 并添加动画组
        UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH-WIDTH*0.8)/2.0, logoY, WIDTH*0.8, WIDTH*0.8/871*430)];
        logo.image = [UIImage imageNamed:@"logoani_0"];
        NSMutableArray * images = [NSMutableArray arrayWithCapacity:12];
        for (int i=0; i<12; i++) {
            images[i] = [AMETools getPNGImageWithName:[NSString stringWithFormat:@"logoani_%d",i]];
        }
        logo.animationImages = images;
        logo.animationDuration = 1.0;
        logo.animationRepeatCount = 1;
        [self.view addSubview:logo];
        //开始动画
        [logo startAnimating];
        //开始动画的同时 显示button和label
        [UIView animateWithDuration:2.0 animations:^{
            versions_lbl.alpha = 0.6;
            start_btn.alpha = 1.0;
        } completion:^(BOOL finished) {
            NSLog(@"animationDone");
            [start_btn addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
        }];
    }];
}

- (void)startGame{
    NSLog(@"loadGame");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"gameStart" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated;
{
    [super viewWillDisappear:animated];
}

- (void)home{
    [_player stop];
}
- (void)back{
    AMESave * save = [AMESave new];
    [save loadWithIndex:[[[NSUserDefaults standardUserDefaults]objectForKey:@"lastSave"] integerValue]];
    if (save.bgmOpen) {
        [_player play];
    }
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
