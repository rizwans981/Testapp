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
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:FACT_URL]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSError *jsonError = nil;
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *) response;
        if (urlResponse.statusCode == 200)
            {
            //converting data into valid encoding format
            NSString *responseString = [[[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] stringByReplacingOccurrencesOfString:@"\t" withString:@""] stringByReplacingOccurrencesOfString:@"\0" withString:@""];
            NSData *resData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            //Parsing response
            NSMutableDictionary *factDetails = [NSJSONSerialization JSONObjectWithData:resData options:0 error:&jsonError];
            
            if (factDetails) {
                Fact *fact = [[Fact alloc] initWithDetails:factDetails];
                completionHandler(fact,nil);
            }
            else if (jsonError) {
                completionHandler(nil,jsonError);
            }
            
            }
        else{
            
            //-- Error Handling mechanism ---//
            completionHandler(nil,connectionError);
        }
    }];
    
   
}

@end
