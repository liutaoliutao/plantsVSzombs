//
//  zombB.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "zombB.h"

@implementation zombB
-(instancetype)initWithFrame:(CGRect)frame{
    self  =[super initWithFrame:frame];
    if (self) {
        self.zombImage = [UIImage imageNamed:@"zomb_2"];
        self.speed =3;
        self.blood = 4;
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
