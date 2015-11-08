//
//  NetworkService.h
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import <Foundation/Foundation.h>


 
@interface NetworkService : NSObject

@property (nonatomic, copy) void (^complitionBlock)(NSDictionary*);
- (void)sendNetworkRequestForURL:(NSString*) urlString;

@end
