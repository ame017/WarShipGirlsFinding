//
//  AMEWarShipGirsButton.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEWarShipGirsButton.h"
#import "AMETools.h"


@implementation AMEWarShipGirsButton

+(instancetype)getRandomWSG{
    AMEWarShipGirsButton * WSG_btn = [[AMEWarShipGirsButton alloc]init];
    NSArray * WSGData = [AMEWarShipGirls getAllWarShipGirs];
    NSUInteger index = arc4random()%WSGData.count;
    AMEWarShipGirls * data = WSGData[index];
    WSG_btn.WarShipGirl = data;
    [WSG_btn setImage:[AMETools getPNGImageWithName:[NSString stringWithFormat:@"wsg_%lu",data.warShipID]] forState:UIControlStateNormal];
    return WSG_btn;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
