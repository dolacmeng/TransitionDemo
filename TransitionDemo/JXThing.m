//
//  JXThing.m
//  TransitionDemo
//
//  Created by JackXu on 16/7/10.
//  Copyright © 2016年 BFMobile. All rights reserved.
//

#import "JXThing.h"

@implementation JXThing

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image overview:(NSString *)overview{
    self = [super init];
    if (nil != self) {
        _title = [title copy];
        _image = image;
        _overview = [overview copy];
    }
    return self;
}

+ (NSArray*)exampleThings{
    return @[
             [[JXThing alloc] initWithTitle:@"Thing 1" image:[UIImage imageNamed:@"thing01.jpg"] overview:@"Drumstick cow beef fatback turkey boudin. Meatball leberkas boudin hamburger pork belly fatback."],
             [[JXThing alloc] initWithTitle:@"Thing 2" image:[UIImage imageNamed:@"thing02.jpg"] overview:@"Shank pastrami sirloin, sausage prosciutto spare ribs kielbasa tri-tip doner."],
             [[JXThing alloc] initWithTitle:@"Thing 3" image:[UIImage imageNamed:@"thing03.jpg"] overview:@"Frankfurter cow filet mignon short loin ham hock salami meatloaf biltong andouille bresaola prosciutto."],
             [[JXThing alloc] initWithTitle:@"Thing 4" image:[UIImage imageNamed:@"thing04.jpg"] overview:@"Pastrami sausage turkey shank shankle corned beef."],
             [[JXThing alloc] initWithTitle:@"Thing 5" image:[UIImage imageNamed:@"thing05.jpg"] overview:@"Tri-tip short loin pork belly, pastrami biltong ball tip ham hock. Shoulder ribeye turducken shankle."]
             ];

}


@end
