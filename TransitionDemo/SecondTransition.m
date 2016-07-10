//
//  SecondTransition.m
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "SecondTransition.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "JXTableViewCell.h"

@implementation SecondTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    SecondViewController *fromViewController = (SecondViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FirstViewController *toViewController = (FirstViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //获得要移动的图片的快照
    UIView *imageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.imageView.superview];
    fromViewController.imageView.hidden = YES;
    
    //获得图片对应的cell
    JXTableViewCell *cell = [toViewController.tableView cellForRowAtIndexPath:[toViewController.tableView indexPathForSelectedRow]];
    NSLog(@"indexPath:%@",[toViewController.tableView indexPathForSelectedRow]);
    cell.leftImageView.hidden = YES;
    
    //设置初始view的状态
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        fromViewController.view.alpha = 0.0;
        imageSnapshot.frame = [containerView convertRect:cell.leftImageView.frame fromView:cell.leftImageView.superview];
        NSLog(@"title:%@",cell.rightTitleLabel.text);
        NSLog(@"frame:%@",NSStringFromCGRect(imageSnapshot.frame));
    } completion:^(BOOL finished) {
        [imageSnapshot removeFromSuperview];
        fromViewController.imageView.hidden = YES;
        cell.leftImageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
    
}




@end