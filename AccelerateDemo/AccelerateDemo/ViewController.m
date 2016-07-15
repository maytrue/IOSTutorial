//
//  ViewController.m
//  AccelerateDemo
//
//  Created by guowei on 7/15/16.
//  Copyright © 2016 guowei. All rights reserved.
//

#import "ViewController.h"
#import "MotionOrientation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MotionOrientation initialize];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationChanged:)
                                                 name:MotionOrientationChangedNotification
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)deviceOrientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [[MotionOrientation sharedInstance] deviceOrientation];
    UIInterfaceOrientation interfaceOrientation = [[MotionOrientation sharedInstance] interfaceOrientation];
    //NSDictionary *userInfo = notification.object;
    //MotionOrientation *motionOrientation = userInfo[kMotionOrientationKey];
    //UIDeviceOrientation deviceOrientation = motionOrientation.deviceOrientation;
    NSLog(@"device orientation %d", deviceOrientation);
    NSLog(@"device orientation %d", interfaceOrientation);
}

@end
