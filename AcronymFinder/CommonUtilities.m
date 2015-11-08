//
//  CommonUtilities.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/8/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "CommonUtilities.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
@implementation CommonUtilities

+(void) displayAlertWithTitle:(NSString*) title andMessage:(NSString*) message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

+(void) showLoadingView {
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    UIView* mainView = appDelegate.window.rootViewController.view;
    [MBProgressHUD showHUDAddedTo:mainView animated:YES];

}

+(void) hideLoadingView {
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    UIView* mainView = appDelegate.window.rootViewController.view;
    [MBProgressHUD hideHUDForView:mainView animated:YES];
}
@end
