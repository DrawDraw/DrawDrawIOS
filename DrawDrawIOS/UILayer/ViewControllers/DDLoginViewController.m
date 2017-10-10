//
//  DDLoginViewController.m
//  DrawDrawIOS
//
//  Created by  Anson Ng on 10/09/2017.
//  Copyright © 2017 DrawDraw. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "DDLoginViewController.h"

@interface DDLoginViewController ()

@end

@implementation DDLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

@end
