//
//  CommonUtilities.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/8/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "CommonUtilities.h"

@implementation CommonUtilities

+(void) displayAlertWithTitle:(NSString*) title andMessage:(NSString*) message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}
@end
