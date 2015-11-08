//
//  AcronymDataManager.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "AcronymDataManager.h"
#import "NetworkService.h"
#import "LongForm.h"

static NSString * const BaseURLString = @"http://www.nactem.ac.uk/software/acromine/dictionary.py";

@interface AcronymDataManager()

@property (nonatomic,strong) NSArray *longFormsArray;

@end

@implementation AcronymDataManager

-(void) getLongFormsForString:(NSString*) shortFormString {
    NSString *urlString = [NSString stringWithFormat:@"%@?sf=%@", BaseURLString,shortFormString];
    NetworkService *networkService = [[NetworkService alloc] init];
    [networkService sendNetworkRequestForURL:urlString];
    [networkService setComplitionBlock:^(NSDictionary* responseDictionary)  {
        //logic to pase the data.
        NSArray* longForms = (NSArray*)[responseDictionary valueForKey:@"lfs"];
        [self parseLongFormsFromArray:longForms];
        if(self.complitionBlock != nil) {
            self.complitionBlock(self.longFormsArray);
        }
    }];
    
}

- (void) parseLongFormsFromArray:(NSArray*) longForms {
    NSMutableArray* longFormsMutableArray = [[NSMutableArray alloc] init];
    for( NSDictionary* longForm in longForms) {
        LongForm* longFormObject = [[LongForm alloc] initWithDictonary:longForm];
        [longFormsMutableArray addObject:longFormObject];
        self.longFormsArray = [[ NSArray alloc] initWithArray:longFormsMutableArray];
        
    }
}

@end
