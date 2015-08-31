//
//  plantALL.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "plantALL.h"
@interface plantALL()
@property(nonatomic)int count;
@property(nonatomic)int ftp;
@end
@implementation plantALL

-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        self.count = -1;
        self.ftp = -1;
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeImage:) userInfo:nil repeats:YES];
       self.plantImage =[UIImage imageNamed:@"plant_0"];
        
    }return self;
    
}
-(void)changeImage:(NSTimer *)time{
    self.ftp++;
    if (self.ftp %10 == 0) {
        self. count++;
        float with =self.plantImage.size.width/8;
        CGImageRef subImage = CGImageCreateWithImageInRect(self.plantImage.CGImage, CGRectMake((self.count%8)*with, 0, with, self.plantImage.size.height));
        self.image = [UIImage imageWithCGImage:subImage];
        CGImageRelease(subImage);
    }
  
}
-(void)beginFire{
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
