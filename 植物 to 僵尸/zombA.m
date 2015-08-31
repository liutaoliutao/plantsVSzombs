//
//  zombA.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "zombA.h"

@implementation zombA

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.zombImage = [UIImage imageNamed:@"zomb_1"];
        self.speed = 2;
        self.blood =3;
    }return self;
}

@end
