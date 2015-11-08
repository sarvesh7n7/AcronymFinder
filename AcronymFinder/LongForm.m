//
//  LongForm.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "LongForm.h"

@implementation LongForm

-(instancetype)initWithDictonary:(NSDictionary*) longFormDictionary {
    self = [super init];
    self.longForm = [longFormDictionary objectForKey:@"lf"];
    self.frequency = [longFormDictionary objectForKey:@"freq"];
    self.yearSince = [longFormDictionary objectForKey:@"since"];

    NSArray* variationsArray = [longFormDictionary objectForKey:@"vars"];
    if(variationsArray != nil && variationsArray.count != 0) {
        NSMutableArray* variationsMutableArray = [[NSMutableArray alloc]init];
        for (NSDictionary* variationLongForm in variationsArray) {
            LongForm* variationLongFormObject = [[LongForm alloc] initWithDictonary:variationLongForm];
            [variationsMutableArray addObject:variationLongFormObject];
        }
         self.variations = [NSArray arrayWithArray:variationsMutableArray];
    }

    return self;

}
@end
