//
//  JXTableViewCell.h
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXThing;

@interface JXTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightTitleLabel;

+(JXTableViewCell*)getReuseableCellWithTableView:(UITableView*)tableView;
-(void)setUpData:(JXThing*)thing;

@end
