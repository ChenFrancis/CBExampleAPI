//
//  CalendarDemoViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-27.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CalendarDemoViewController.h"

@interface CalendarDemoViewController ()

@end

@implementation CalendarDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
