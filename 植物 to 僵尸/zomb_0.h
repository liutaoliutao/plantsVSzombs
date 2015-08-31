//
//  zomb_0.h
//  植物 to 僵尸
//
//  Created by dlw on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zomb_0 : UIImageView
@property(nonatomic,strong)UIImage *zombImage;
@property(nonatomic)CGFloat speed;
@property(nonatomic)int blood;
@property(nonatomic,strong)NSTimer *timer;
@end
