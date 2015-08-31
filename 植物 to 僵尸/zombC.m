//
//  zombC.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "zombC.h"

@implementation zombC
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.zombImage = [UIImage imageNamed:@"zomb_3"];
        self.speed = 5;
        self.blood =2;
    }return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
