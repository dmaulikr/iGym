//
//  ViewController.m
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPersistentData:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savePersistentData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)butTwoHead:(id)sender {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"btnNow"];
    [userDefaults synchronize];
}

- (IBAction)butPushup:(id)sender {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:2 forKey:@"btnNow"];
    [userDefaults synchronize];
    
}

- (IBAction)butSitup:(id)sender {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:3 forKey:@"btnNow"];
    [userDefaults synchronize];
    
}

- (IBAction)butSquat:(id)sender {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:4 forKey:@"btnNow"];
    [userDefaults synchronize];
    
}

-(void)savePersistentData:(id)sender{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    //[userDefaults setObject:self.labelTwoHead.text forKey:@"levelTwoHead"];
    //[userDefaults setObject:self.labelPushup.text forKey:@"levelPushup"];
    //[userDefaults setObject:self.labelSitup.text forKey:@"levelSitup"];
    //[userDefaults setObject:self.labelSquat.text forKey:@"levelSquat"];
    [userDefaults synchronize];
}

-(void)loadPersistentData:(id)sender{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.labelTwoHead.text=[NSString stringWithFormat:@"Level %li",[userDefaults integerForKey:@"levelTwoHead"]];
    self.labelPushup.text=[NSString stringWithFormat:@"Level %li",[userDefaults integerForKey:@"levelPushup"]];
    self.labelSitup.text=[NSString stringWithFormat:@"Level %li",[userDefaults integerForKey:@"levelSitup"]];
    self.labelSquat.text=[NSString stringWithFormat:@"Level %li",[userDefaults integerForKey:@"levelSquat"]];
}



@end
