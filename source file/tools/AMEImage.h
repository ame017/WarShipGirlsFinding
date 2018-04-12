//
//  AMEImg.h
//  fire
//
//  Created by syetc053 on 16/5/18.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMEImage : UIView
@property (nonatomic,retain)NSMutableArray * animationImages;
@property (nonatomic)NSUInteger animationRepeatCount;
@property (nonatomic)float animationduration;
@property (nonatomic)BOOL endAnimationRemove;//default is YES;


-(void)startAnimation;

-(void)stopAnimation;

@end
