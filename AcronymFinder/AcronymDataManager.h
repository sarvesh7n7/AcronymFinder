//
//  AcronymDataManager.h
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymDataManager : NSObject


@property (nonatomic, copy) void (^complitionBlock)(NSArray*);

-(void) getLongFormsForString:(NSString*) shortFormString;

@end
