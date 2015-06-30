//
//  ViewController.h
//  iGym
//
//  Created by VincentChen on 2015/6/22.
//  Copyright (c) 2015年 VincentChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

struct packagesend{
    int level;
    __unsafe_unretained NSString* chinseString;
    __unsafe_unretained NSString* englishString;
};

- (IBAction)butTwoHead:(id)sender;
- (IBAction)butPushup:(id)sender;
- (IBAction)butSitup:(id)sender;
- (IBAction)butSquat:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelTwoHead;
@property (weak, nonatomic) IBOutlet UILabel *labelPushup;
@property (weak, nonatomic) IBOutlet UILabel *labelSitup;
@property (weak, nonatomic) IBOutlet UILabel *labelSquat;

@end

