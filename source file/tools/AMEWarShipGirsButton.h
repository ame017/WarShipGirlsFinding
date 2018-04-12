//
//  AMEWarShipGirsButton.h
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMEWarShipGirls.h"

@interface AMEWarShipGirsButton : UIButton

@property (nonatomic,retain) AMEWarShipGirls * WarShipGirl;
@property (nonatomic) CGRect lastFrame;
@property (nonatomic) NSUInteger selectedIndex;

+(instancetype)getRandomWSG;


@end
