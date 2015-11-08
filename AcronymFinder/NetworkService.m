//
//  NetworkService.m
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/7/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import "NetworkService.h"
#import "AFNetworking.h"
#import "CommonUtilities.h"


@implementation NetworkService

- (void)sendNetworkRequestForURL:(NSString*) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        if(self.complitionBlock != nil) {
            NSArray* responseArray = (NSArray*)responseObject;
            if (responseArray != nil && responseArray.count > 0) {
                self.complitionBlock((NSDictionary*)responseArray[0]);
            }
            else {
                [CommonUtilities displayAlertWithTitle:@"No Full Forms Found" andMessage:@"There were no Full Form Found for the given search. Please search for other Acronyms."];
            }
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [CommonUtilities displayAlertWithTitle:@"Error Retrieving the acronym" andMessage:[error localizedDescription]];
    }];
    [operation start];
}


@end
