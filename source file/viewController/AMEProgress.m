//
//  AMEProgress.m
//  WarShipGirlsFinding
//
//  Created by Apple on 16/6/12.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEProgress.h"

@implementation AMEProgress


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _progress = 1.0;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _progress = 1.0;
    }
    return self;
}


- (void)setProgress:(double)progress{
    _progress = progress;
    if (_progress>1.0) {
        _progress = 1.0;
    }
    if (_progress<0) {
        _progress = 0;
    }
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self.trackImage drawInRect:rect];
    [self.progressImage drawInRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width*(_progress/1.0), rect.size.height)];
}

@end
