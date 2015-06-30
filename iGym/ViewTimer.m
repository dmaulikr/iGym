//
//  ViewTimer.m
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import "ViewTimer.h"

@implementation ViewTimer

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    
    switch([userDefaults integerForKey:@"btnNow"]){
        case 1:
            self.Title = @"二頭肌訓練";
            self.Dos = [userDefaults integerForKey:@"levelTwoHead"];
            break;
        case 2:
            self.Title = @"伏地挺身訓練";
            self.Dos = [userDefaults integerForKey:@"levelPushup"];
            break;
        case 3:
            self.Title = @"仰臥起坐訓練";
            self.Dos = [userDefaults integerForKey:@"levelSitup"];
            break;
        case 4:
            self.Title = @"深蹲訓練";
            self.Dos = [userDefaults integerForKey:@"levelSquat"];
            break;
    }
    self.Dos+=1;
    self.labelTitle.text=self.Title;
    self.labelDos.text = [NSString stringWithFormat:@"%li-%li-%li-%li-%li",self.Dos/2+1,self.Dos-1,self.Dos,self.Dos-1,self.Dos/2+1];
    self.btnNext.enabled=YES;
    self.sitnow = 0;
    self.doNow=1;
    
    [self updateFullView];
}

- (IBAction)btnNextstep:(id)sender {
    self.sitnow++;
    [self.myTimer invalidate];
    [self updateFullView];
}

-(void)updateFullView{
    self.timeNow= 30;
    if(self.Dos > 5 && self.Dos < 10) self.timeNow = 60;
    else if(self.Dos > 9 && self.Dos < 18) self.timeNow=90;
    switch (self.sitnow) {
        case 0:
            [self callDoing:self.Dos/2+1];
            break;
        case 1:
            [self callTimer];
            break;
        case 2:
            [self callDoing:self.Dos-1];
            break;
        case 3:
            [self callTimer];
            break;
        case 4:
            [self callDoing:self.Dos];
            break;
        case 5:
            [self callTimer];
            break;
        case 6:
            [self callDoing:self.Dos-1];
            break;
        case 7:
            [self callTimer];
            break;
        case 8:
            [self callDoing:self.Dos/2+1];
            break;
        case 9:
            [self callLevelUp];
            break;
        default:
            break;
    }
}

-(void)callDoing:(NSInteger)n{
    self.labelSit.text=[NSString stringWithFormat:@"第 %li 組,做完請按Done",self.doNow++];
    [self.btnNext setTitle:@"Done" forState:UIControlStateNormal];
    self.labelDoing.text=[NSString stringWithFormat:@"%li",n];
}

-(void)callTimer{
    self.labelSit.text=[NSString stringWithFormat:@"休息中，按Skip來進行第 %li 組",self.doNow];
    [self.btnNext setTitle:@"Skip" forState:UIControlStateNormal];
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 // 秒
                                                    target:self
                                                  selector:@selector(update:)
                                                  userInfo:nil
                                                   repeats:YES];
}

-(void)callLevelUp{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    self.btnNext.enabled=NO;
    if(self.Dos==17){
        self.labelSit.text=@"您在本訓練已晉升到 Top Level";
    }else{
        self.labelSit.text=[NSString stringWithFormat:@"恭喜! 您已晉升到Level %li",self.Dos];
        NSString *final=[NSString stringWithFormat:@"%li",self.Dos];
        switch([userDefaults integerForKey:@"btnNow"]){
            case 1:
                [userDefaults setObject:final forKey:@"levelTwoHead"];
                break;
            case 2:
                [userDefaults setObject:final forKey:@"levelPushup"];
                break;
            case 3:
                [userDefaults setObject:final forKey:@"levelSitup"];
                break;
            case 4:
                [userDefaults setObject:final forKey:@"levelSquat"];
                break;
        }
        [userDefaults synchronize];
    }
}

-(void)update:(id)sender{
    if(self.timeNow>0){
        self.labelDoing.text=[NSString stringWithFormat:@"%li s",self.timeNow--];
    }else if(self.timeNow==0){
        self.labelSit.text=[NSString stringWithFormat:@"按Next來進行第 %li 組",self.doNow];;
        [self.btnNext setTitle:@"Next" forState:UIControlStateNormal];
        self.labelDoing.text=[NSString stringWithFormat:@"%li s",self.timeNow];
    }
}
@end
