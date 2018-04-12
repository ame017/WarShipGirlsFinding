//
//  AMELabel.m
//  AMELabelTest
//
//  Created by Apple on 16/5/21.
//  Copyright © 2016年 AME studio Co., LTD. All rights reserved.
//

#import "AMELabel.h"

@implementation AMELabel
{
    NSTimer * _timer;
    NSString * _allText;
    NSUInteger _textIndex;
//    void (^comple)(void);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.verticalAlignment = VerticalAlignmentMiddle;
        self.fillColor = [UIColor blackColor];
        self.strokeColor = [UIColor clearColor];
        self.strokeWidth = 0.0;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}


- (void)startAnime{
    [_timer invalidate];
    _textIndex = 1;
    _allText = self.text;
    self.text = @"";
    self.hidden = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(running) userInfo:nil repeats:YES];
}
- (void)stopAnime{
    [_timer invalidate];
}

- (void)running{
    self.text = [_allText substringToIndex:_textIndex];
    [self setNeedsDisplay];
    if (_textIndex == _allText.length) {
        [_timer invalidate];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"textAnimationDone" object:nil];
//        if (comple) {
//            comple();
//        }
//        comple = nil;
        _textIndex = 1;
        return ;
    }
    _textIndex++;
}
//- (void)startAnimeWithcompletion:(void(^)(void))completion{
//    comple = completion;
//    textIndex = 1;
//    allText = self.text;
//    self.text = @"";
//    self.hidden = NO;
//    timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(running) userInfo:nil repeats:YES];
//}

- (void)drawRect:(CGRect)rect{
        CGContextRef c = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(c, self.strokeWidth);
        CGContextSetLineJoin(c, kCGLineJoinRound);
        CGContextSetTextDrawingMode(c, kCGTextStroke);
        self.textColor = self.strokeColor;
        [self drawTextInRect:rect];
        self.textColor = self.fillColor;
        CGContextSetTextDrawingMode(c, kCGTextFill);
        [self drawTextInRect:rect];
}

- (void)delayMethod{
    
}

@end
