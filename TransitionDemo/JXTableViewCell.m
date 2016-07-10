//
//  JXTableViewCell.m
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "JXTableViewCell.h"
#import "JXThing.h"

@interface JXTableViewCell()


@end

@implementation JXTableViewCell

+(JXTableViewCell*)getReuseableCellWithTableView:(UITableView*)tableView{
    JXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JXTableViewCell"];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)setUpData:(JXThing*)thing{
    [self.leftImageView setImage:thing.image];
    [self.rightTitleLabel setText:thing.title];
}

@end
