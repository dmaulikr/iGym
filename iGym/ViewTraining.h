//
//  ViewTraining.h
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewTraining : ViewController
- (IBAction)btnMinus:(id)sender;
- (IBAction)btnPlus:(id)sender;
- (IBAction)btnStart:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel;
@property (weak, nonatomic) IBOutlet UILabel *labelDos;

@end
