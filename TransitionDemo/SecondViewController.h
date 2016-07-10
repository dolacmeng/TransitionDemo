//
//  SecondViewController.h
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXThing;

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) JXThing *thing;

@end
