
//
//  plantA.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "plantA.h"

@implementation plantA
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.plantImage =[UIImage imageNamed:@"plant_0"];
        //[self addSunFlower];//不能在这里写 这里是一被创建就开始，应该在touchend 开始
        //点击太阳的时候，图片每有任何变化 是因为父视图每打开用户交互
       
    self.userInteractionEnabled = YES;
         self.costSunCount =50;
    }return self;
}

-(void)beginFire{
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(addSunFlowerTwo) userInfo:nil repeats:YES];
    
}
-(void)addSunFlowerTwo{
    UIButton *sunBT = [[UIButton alloc]initWithFrame:CGRectMake(-15,-15, 25, 25)];
    [sunBT setImage:[UIImage imageNamed:@"sun"] forState:UIControlStateNormal];
    [sunBT addTarget:self action:@selector(sunBTdismiss:) forControlEvents:UIControlEventTouchUpInside];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(sunBTdismissOutTime:) userInfo:sunBT repeats:NO];
    [self addSubview:sunBT];
  
}
-(void)sunBTdismiss:(UIButton*)btn{
    [btn removeFromSuperview];
    //[[NSNotificationCenter defaultCenter]postNotificationName:@"addsun" object:nil userInfo:@{@"count":@(25)}];
    [self.delegate addsunCount:25];
    
    
    
}
-(void)sunBTdismissOutTime:(NSTimer*)timer{
    UIButton *button = timer.userInfo;
    [button removeFromSuperview];
    //这里不能把sunBT 直接传过来 然后直接删除，这样会报错，要直接放在useinfo里面就不会报错
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
