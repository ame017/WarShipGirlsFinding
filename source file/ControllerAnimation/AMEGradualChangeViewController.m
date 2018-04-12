//
//  AMEGradualChangeViewController.m
//  WarShipGirlsFinding
//
//  Created by syetc053 on 16/5/31.
//  Copyright © 2016年 AME studio Co. LTD. All rights reserved.
//

#import "AMEGradualChangeViewController.h"

@implementation AMEGradualChangeViewController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [UIView transitionFromView:fromViewController.view toView:toViewController.view duration:[self transitionDuration:nil] options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    [[transitionContext containerView] addSubview:toViewController.view];
}

@end
