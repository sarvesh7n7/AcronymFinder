//
//  LongForm.h
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LongForm : NSObject

@property (nonatomic,strong) NSString* longForm;
@property (nonatomic,strong) NSNumber* frequency;
@property (nonatomic,strong) NSNumber* yearSince;
@property (nonatomic,strong) NSArray* variations;

-(instancetype)initWithDictonary:(NSDictionary*) longFormDictionary;
@end
