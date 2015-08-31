//
//  ViewController.m
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *allSuperimagView;
@property(nonatomic,strong)UIImageView * imageView;
@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (weak, nonatomic) IBOutlet UIView *viewTwo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
  
   
    
}












-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    for (UIImageView *view in self.allSuperimagView) {
        if (CGRectContainsPoint(view.frame, point)) {
            self.imageView = [[UIImageView alloc]initWithFrame:view.frame];
            self.imageView.image  = view.image;
            [self.view addSubview:self.imageView];
        }
        
    }
    
   
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.imageView.center = point;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (self.imageView) {
       
        if (CGRectContainsPoint(self.viewOne.frame, point)) {
             NSLog(@"d");
            CGPoint oldPoint = self.imageView.center;
            //子控件的位置改变父视图的时候需要将原来视图的中心点或fram 改变到现在视图
         CGPoint newPoint  = [self.view convertPoint:oldPoint toView:self.viewOne];
             self.imageView.center = newPoint;
            [self.viewOne addSubview:self.imageView];
           //勾选 clip view 父视图切割子视图
        }else if(CGRectContainsPoint(self.viewTwo.frame, point)){
            
            [self.viewTwo addSubview:self.imageView];
        }else{
            [self.imageView removeFromSuperview];
        }
        
    }
    
    //self.imageView =nil;//用过之后要把它释放掉，不能继续拖动
    
}















@end
