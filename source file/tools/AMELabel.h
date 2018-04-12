//
//  AMELabel.h
//  AMELabelTest
//
//  Created by Apple on 16/5/21.
//  Copyright © 2016年 AME studio Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,VerticalAlignment)
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom
};

@interface AMELabel : UILabel

@property (nonatomic,assign) float strokeWidth;
@property (nonatomic,retain) UIColor * strokeColor;
@property (nonatomic,retain) UIColor * fillColor;


@property (nonatomic) VerticalAlignment verticalAlignment;


//- (void)startAnimeWithcompletion:(void(^)(void))completion;
- (void)startAnime;
- (void)stopAnime;

@end
