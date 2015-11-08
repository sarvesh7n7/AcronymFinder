//
//  CommonUtilities.h
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/8/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonUtilities : NSObject

+(void) displayAlertWithTitle:(NSString*) title andMessage:(NSString*) message;
+(void) showLoadingView;
+(void) hideLoadingView;
@end
