//
//  plantALL.h
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gameViewController.h"
@interface plantALL : UIImageView
@property(nonatomic,strong)UIImage *plantImage;
@property(nonatomic,weak)gameViewController *delegate;
@property(nonatomic)int costSunCount;
-(void)beginFire;
-(void)changeImage:(NSTimer *)time;
@end
