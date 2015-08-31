//
//  planC.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "planC.h"

@implementation planC
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.plantImage =[UIImage imageNamed:@"plant_2"];
        self.bulletName =@"bullet_0.png";
        self.costSunCount = 150;
    }return self;
}


@end
