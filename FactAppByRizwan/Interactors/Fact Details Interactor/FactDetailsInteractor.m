//
//  FactDetailsInteractor.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactDetailsInteractor.h"
#import "Constants.h"
@implementation FactDetailsInteractor
#pragma mark - Retrieving Fact Details
-(void)retrieveFactWithCompletionHandler:(void (^)(Fact *factDetails, NSError *error))completionHandler
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:FEED_URL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSError *jsonError = nil;
            //converting data into valid encoding format
            NSString *responseString = [[[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] stringByReplacingOccurrencesOfString:@"\t" withString:@""] stringByReplacingOccurrencesOfString:@"\0" withString:@""];
            NSData *resData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            //Parsing response
            NSMutableDictionary *factDetails = [NSJSONSerialization JSONObjectWithData:resData options:0 error:&jsonError];
            
            if (factDetails) {
                Fact *fact = [[Fact alloc] initWithDetails:factDetails];
                completionHandler(fact,nil);
            }else if (jsonError) {
                completionHandler(nil,jsonError);
            }
            else{
                completionHandler(nil,error);
            }
        }];
        [dataTask resume];
    });
}

@end
