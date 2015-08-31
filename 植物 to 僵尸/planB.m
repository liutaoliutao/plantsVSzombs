//
//  planB.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "planB.h"

@interface planB()


@end
@implementation planB
-(NSMutableArray *)bulletArray{
    if (!_bulletArray) {
        _bulletArray = [NSMutableArray array];
    }return _bulletArray;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.plantImage =[UIImage imageNamed:@"plant_4"];
       self.bulletName=@"bullet_4";
        self.costSunCount = 100;
    }return self;
}


-(void)beginFire{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addbullet) userInfo:nil repeats:YES];

}
-(void)addbullet{
    UIImageView * bulletIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15,15)];
   
    bulletIV .image = [UIImage imageNamed:self.bulletName];
    
    CGPoint center= self.superview.center;
    bulletIV.center = CGPointMake(center.x+20, center.y);
    [self.delegate.view addSubview: bulletIV];
    [self.bulletArray addObject:bulletIV];
}



-(void)changeImage:(NSTimer *)time{
    [super changeImage:time];
    for (UIImageView *bulletIV in self.bulletArray) {
        CGPoint point =bulletIV.center;
        point.x+=5;
        bulletIV.center=point;
        if (point.x>600) {
            [bulletIV removeFromSuperview];
            //还要从数组中将其删除
            [self.bulletArray removeObject:bulletIV];
            //这样做会导致报错，for in 循环中如果删除数组元素还要遍历 是不行的
            break;//必须跳出才可以
            
        }
    }
   
}

@end
