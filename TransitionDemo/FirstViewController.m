//
//  ViewController.m
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "FirstViewController.h"
#import "JXThing.h"
#import "JXTableViewCell.h"
#import "SecondViewController.h"
#import "FirstTransition.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *things;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100.0;
    [self.view addSubview:_tableView];
    _things = [JXThing exampleThings];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (fromVC == self && [toVC isKindOfClass:[SecondViewController class]]) {
        return [[FirstTransition alloc] init];
    }
    else {
        return nil;
    }
}

#pragma mark UITableViewDelegate&DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.things.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JXTableViewCell *cell = [JXTableViewCell getReuseableCellWithTableView:tableView];
    [cell setUpData:self.things[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.thing = self.things[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
