//
//  ViewTimer.h
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewTimer : ViewController
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDos;
@property (weak, nonatomic) IBOutlet UILabel *labelDoing;
@property (weak, nonatomic) IBOutlet UILabel *labelSit;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (nonatomic) int sitnow;
@property (nonatomic) NSInteger Dos,timeNow,doNow;
@property (nonatomic) NSString *Title;
@property (nonatomic) NSTimer *myTimer;

- (IBAction)btnNextstep:(id)sender;

@end
