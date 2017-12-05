//
//  PlayerViewController.h
//  Test
//
//  Created by qyhc on 2017/12/5.
//  Copyright © 2017年 com.qykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerViewController : UIViewController

@property (nonatomic,copy) NSString *url;

@property (copy, nonatomic) void (^playFinished)();


@end
