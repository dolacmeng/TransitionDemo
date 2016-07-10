//
//  SecondViewController.m
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "JXThing.h"
#import "SecondTransition.h"

#define SCREENW [UIScreen mainScreen].bounds.size.width

@interface SecondViewController ()<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.frame = CGRectMake((SCREENW-200)*0.5, 50+64, 200, 200);
    self.title = self.thing.title;
    self.imageView.image = self.thing.image;
    self.overviewLabel.text = self.thing.overview;
    
    UIScreenEdgePanGestureRecognizer *popRegognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
    popRegognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:popRegognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (fromVC == self && [toVC isKindOfClass:[FirstViewController class]]) {
        return [[SecondTransition alloc] init];
    }
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if ([animationController isKindOfClass:[SecondTransition class]]) {
        return self.interactivePopTransition;
    }
    return nil;
}

-(void)handlePopRecognizer:(UIScreenEdgePanGestureRecognizer*)recognizer{
    //计算用户拖动距离
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(recognizer.state == UIGestureRecognizerStateChanged){
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled){
        if (progress > 0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }else{
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        
        self.interactivePopTransition = nil;
    }
}



@end
