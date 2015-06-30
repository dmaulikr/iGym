//
//  ViewTraining.m
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import "ViewTraining.h"

@implementation ViewTraining

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    switch([userDefaults integerForKey:@"btnNow"]){
        case 1:
            self.labelTitle.text = @"二頭肌訓練";
            self.labelLevel.text = [userDefaults objectForKey:@"levelTwoHead"];
            break;
        case 2:
            self.labelTitle.text = @"伏地挺身訓練";
            self.labelLevel.text = [userDefaults objectForKey:@"levelPushup"];
            break;
        case 3:
            self.labelTitle.text = @"仰臥起坐訓練";
            self.labelLevel.text = [userDefaults objectForKey:@"levelSitup"];
            break;
        case 4:
            self.labelTitle.text = @"深蹲訓練";
            self.labelLevel.text = [userDefaults objectForKey:@"levelSquat"];
            break;
    }
    NSInteger n = self.labelLevel.text.integerValue + 1;
    self.labelDos.text = [NSString stringWithFormat:@"%li-%li-%li-%li-%li",n/2+1,n-1,n,n-1,n/2+1];
}

- (IBAction)btnMinus:(id)sender {
    int levelnow=self.labelLevel.text.intValue;
    if(levelnow>1)levelnow--;
    self.labelLevel.text = [NSString stringWithFormat:@"%i",levelnow];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    switch([userDefaults integerForKey:@"btnNow"]){
        case 1:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelTwoHead"];
            break;
        case 2:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelPushup"];
            break;
        case 3:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelSitup"];
            break;
        case 4:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelSquat"];
            break;
    }
    NSInteger n = self.labelLevel.text.integerValue + 1;
    self.labelDos.text = [NSString stringWithFormat:@"%li-%li-%li-%li-%li",n/2+1,n-1,n,n-1,n/2+1];

    [userDefaults synchronize];
}

- (IBAction)btnPlus:(id)sender {
    int levelnow=self.labelLevel.text.intValue;
    if(levelnow<16)levelnow++;
    self.labelLevel.text = [NSString stringWithFormat:@"%i",levelnow];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    switch([userDefaults integerForKey:@"btnNow"]){
        case 1:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelTwoHead"];
            break;
        case 2:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelPushup"];
            break;
        case 3:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelSitup"];
            break;
        case 4:
            [userDefaults setObject:self.labelLevel.text forKey:@"levelSquat"];
            break;
    }
    NSInteger n = self.labelLevel.text.integerValue + 1;
    self.labelDos.text = [NSString stringWithFormat:@"%li-%li-%li-%li-%li",n/2+1,n-1,n,n-1,n/2+1];

    [userDefaults synchronize];
}

- (IBAction)btnStart:(id)sender {
}

- (IBAction)btnBack:(id)sender {
}
@end
