//
//  zomb_0.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "zomb_0.h"
@interface zomb_0 ()
@property (nonatomic)NSInteger  count;

@end
@implementation zomb_0

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         self.zombImage = [UIImage imageNamed:@"zomb_0"];
        self.count = -1;
      self.timer =  [NSTimer  scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeImage:) userInfo:nil repeats:YES];
    }return self;
}
-(void)changeImage:(NSTimer*)time{
    self.count++;
   
     CGImageRef subImage  =CGImageCreateWithImageInRect(self.zombImage.CGImage, CGRectMake((self.count%8)*self.zombImage.size.width/8, 0,self.zombImage.size.width/8, self.zombImage.size.height ));
    self.image = [UIImage imageWithCGImage:subImage];
    CGPoint point = self.center;
    point.x =point.x -self.speed;
    self.center = point;
    ///必须要清除掉对象
    CGImageRelease(subImage);
    //怎样清除掉出了屏幕的zomb
    //只是remove from self.view  和addsubview相对，但是nstimer引用了他
    if (self.center.x<30) {
        [self removeFromSuperview];
        [time invalidate];
    }
    //当使用timer 的时候 timer 会给tagert的值加1 当timer停止的时候就释放掉
    
}

-(void)dealloc{
    NSLog(@"僵尸死掉了");
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
