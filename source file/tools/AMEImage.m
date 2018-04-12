//
//  AMEImg.m
//  fire
//
//  Created by syetc053 on 16/5/18.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEImage.h"


@implementation AMEImage
{
    NSTimer * _timer;
    NSUInteger _index;
    NSUInteger _nowRepeatCount;
    BOOL _isAnimating;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.animationRepeatCount = HUGE_VALF;
        self.backgroundColor = [UIColor clearColor];
        self.endAnimationRemove = YES;
        _isAnimating = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.animationRepeatCount = HUGE_VALF;
        self.backgroundColor = [UIColor clearColor];
        self.endAnimationRemove = YES;
        _isAnimating = NO;
    }
    return self;
}
-(void)startAnimation{
    [_timer invalidate];
    _isAnimating = YES;
    _index = 0;
    _nowRepeatCount =0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.animationduration/(float)self.animationImages.count target:self selector:@selector(running) userInfo:nil repeats:YES];
}

-(void)stopAnimation{
    [_timer invalidate];
    _isAnimating = NO;
}


-(void)running{
    @synchronized(self) {
        [self setNeedsDisplay];
        _index++;
        if (_index==self.animationImages.count) {
            _index=0;
            _nowRepeatCount++;
            if (_nowRepeatCount==self.animationRepeatCount){
                [_timer invalidate];
                _isAnimating = NO;
                if (self.endAnimationRemove) {
                    [self removeFromSuperview];
                }
            }
        }
    }
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if ([self.animationImages[_index] class] == [UIImage class]&&_isAnimating) {
        [self.animationImages[_index] drawInRect:rect];
    }
}

@end
