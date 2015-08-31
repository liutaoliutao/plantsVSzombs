//
//  gameViewController.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "gameViewController.h"
#import "zomb_0.h"
#import "zombA.h"
#import "zombB.h"
#import "zombC.h"
#import "plantALL.h"
#import "plantA.h"
#import "planB.h"
#import "planC.h"
#import "planD.h"
@interface gameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *planImage;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *plantHomeView;
@property (weak, nonatomic) IBOutlet UIImageView *boardImageView;
@property (weak, nonatomic) IBOutlet UILabel *sunCountLable;
@property(nonatomic,strong)NSMutableArray *zombs;
@property(nonatomic,strong)NSMutableArray *plants;

@property(nonatomic,strong)plantALL *plant;
@end

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zombs = [NSMutableArray array];
    self.plants= [NSMutableArray array];
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addCount:) name:@"addsun" object:nil];
       [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addZomb) userInfo:nil repeats:YES];
    //子弹和zomb的碰撞检测
    [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(checkCrashZombAndBullet) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(checkCrashZombAndPlant) userInfo:nil repeats:YES];

    [self getPlants];
    
}
-(void)checkCrashZombAndBullet{
    for (zomb_0*zomb in self.zombs) {
        for (plantALL *plant in self.plants) {
            //当为豌豆和寒冰是才有子弹
            if ([plant isKindOfClass:[planB class]]) {
                planB *planb = (planB*)plant;
                for (UIImageView *bulletIV in planb.bulletArray) {
                    //判断两个矩形是否交叉
                    if (CGRectIntersectsRect(zomb.frame,bulletIV.frame)) {
                        
                        [bulletIV removeFromSuperview];
                        [planb.bulletArray removeObject:bulletIV];
                        zomb.blood--;
                        if (zomb.blood==0) {
                            [zomb.timer invalidate];
                            [zomb removeFromSuperview];
                            [self.zombs removeObject:zomb];
                        }
                        
                        return;
                        //break 和return 的区别  break 只能跳出一层循环 ，return 跳出整个循环
                        
                        
                    }
                }
                
            }
        }
    }
    
    
}
//判断两个视图是否交叉碰撞 需要视图在一个父视图中
-(void)checkCrashZombAndPlant{
    for (plantALL *plant in self.plants) {
        for ( zomb_0 *zomb in self.zombs) {
            if (CGRectIntersectsRect(zomb.frame, plant.superview.frame)) {
                zomb.speed =0;
            }
        }
    }
    
    
}
-(void)addsunCount:(int)count{
    self.sunCountLable.text = [NSString stringWithFormat:@"%d",self.sunCountLable.text.intValue +count];
}
//-(void)addCount:(NSNotification *)noti{
//    NSDictionary *dic = noti.userInfo;
//    self.sunCountLable.text = [NSString stringWithFormat:@"%d",self.sunCountLable.text.intValue +[dic[@"count"] intValue] ];
//}

-(void)getPlants{
    
    UIImage * image =[ UIImage imageNamed:@"seedpackets"];
    float with = image.size.width/18;
    
    for (int i = 0; i<self.planImage.count; i++) {
        float x = 0;
        switch (i) {
            case 0:
                x = 0;
                break;
            case 1:
                x=with;
                break;
            case 2:
                x=3*with;
                break;
            case 3:
                x= 4*with;
            default:
                break;
                
        }
            CGImageRef subImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, 0, with,image.size.height ));
     
        UIImageView *imageview = self.planImage[i];
        imageview.image =   [UIImage imageWithCGImage:subImage];
        CGImageRelease(subImage);
    
        
    }
}





-(void)addZomb{
    int type = arc4random()%3;
    int line = arc4random()%5+1;
    zomb_0 *zomb = nil;//多态，父类的对象 可以指向子类的对象
    switch (type) {
        case 0:
        {zomb = [[zombA alloc]initWithFrame:CGRectMake(self.view.bounds.size.width,line*60 , 45, 60)];
            }
            break;
        case 1:
            
           zomb = [[zombB alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, line*60, 45, 60)];
           // [self.view addSubview:zb];}
            break;
        case 2:
         zomb = [[zombC alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, line*60, 45, 60)];
            //[self.view addSubview:zc];}
            break;
            
        default:
            break;
    }
  
            [self.view addSubview:zomb];
    [self.zombs addObject:zomb];
    
   
    
    
    
    
   
   
}
        
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [ touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    int count = self.sunCountLable.text.intValue;
    for (int i = 0; i<self.planImage.count; i++) {
        UIImageView *imageView = self.planImage[i];
//        if (imageView.alpha!=1) {
//            return;
//        }
        switch (i) {
            case 0:
                if ( CGRectContainsPoint(imageView.frame, point)) {
                    if (count<50||imageView.alpha!=1) {
                        return;
                    }
                    self.plant =[[plantA alloc]initWithFrame:imageView.frame] ;
                    self.plant.tag = i;
                    
                }
                break;
                
            case 1:
                if ( CGRectContainsPoint(imageView.frame, point)) {
                    if (count<100||imageView.alpha!=1) {
                        return;
                    }
                    self.plant =[[planB alloc]initWithFrame:imageView.frame] ;
                   self.plant.tag = i;
                }
                break;
            case 2:
                if ( CGRectContainsPoint(imageView.frame, point)) {
                    if (count<150||imageView.alpha!=1) {
                        return;
                    }
                    self.plant =[[planC alloc]initWithFrame:imageView.frame] ;
                    self.plant.tag = i;
                }
                break;
            case 3:
                if ( CGRectContainsPoint(imageView.frame, point)) {
                    if (count<200||imageView.alpha!=1) {
                        return;
                    }
                    self.plant =[[planD alloc]initWithFrame:imageView.frame] ;
                    self.plant.tag = i;
                }
                break;
                
                
                
                
            default:
                break;
                
       
        }
       
     
        
        self.plant.delegate=self; //给代理赋值；每个对象都需要
         [self.view addSubview:self.plant];
       
    }
    //取掉之后 冷却时间
    UIImageView *imageViewt = self.planImage[self.plant.tag];
    imageViewt.alpha = 0.5;
    [UIView animateWithDuration:5 animations:^{
        imageViewt.alpha = 0.99;
    } completion:^(BOOL finished) {
        imageViewt.alpha =1;
    }];
    [self.plant.delegate addsunCount:-self.plant.costSunCount];
   
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [ touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.plant.center =point ;
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [ touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (self.plant) {
        for (UIView *view in self.plantHomeView) {
            if (CGRectContainsPoint(view.frame, point)&&view.subviews.count==0) {
                //CGPoint newCenter =[self.view convertPoint:self.plant.center toView:view];
//                if (view.subviews.count>1) {
//                    [self.plant removeFromSuperview];
//                }else {
                [view addSubview:self.plant];
                CGPoint viewPoint =CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2);
                self.plant.center = viewPoint;
                //        }else{
                //            [self.plant removeFromSuperview];
                //这里的判断是错误的，还没有判断完就已经删除了，一次执行一遍
                
            }
            
        }
        [self.plants addObject:self.plant];  ////////////////////////////////////////////////注意这里加的位置，不不然碰到对象就要报错
        /////////////////////////////////////
    }
  
    //如果拖拽的视图的父视图还是self。view 那么就将其删除
    if ([self.plant.superview isEqual:self.view]) {
        [self.plant removeFromSuperview];
    }
    
    [self.plant beginFire];
   
    self.plant=nil;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
