//
//  JXThing.h
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXThing : NSObject

@property (nonatomic, copy , readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, strong) UIImage *image;

+ (NSArray*)exampleThings;
- (instancetype)initWithTitle:(NSString*)title image:(UIImage*)image overview:(NSString*)overview;

@end
