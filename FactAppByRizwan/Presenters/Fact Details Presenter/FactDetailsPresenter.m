//
//  FactDetailsPresenter.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactDetailsPresenter.h"
#import "FactDetailsView.h"

@implementation FactDetailsPresenter
-(void)viewDidLoad
{
    [self.factDetailsView showLoading];
    [self.factDetailsInteracter retrieveFactWithCompletionHandler:^(Fact *factDetails, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.factDetailsView hideLoading];
                [self.factDetailsView showFactDetails:factDetails];
            });
        }
        else
            {
            //-- Error Handling mechanism ---//
            
            [self.factDetailsView hideLoading];
            
            [self.factDetailsView showAlertController];
            }
    }];
}

@end
