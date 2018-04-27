//
//  FactDetailsInteractor.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//
#import <Foundation/Foundation.h>

@class FactDetailsPresenter;

#import "Fact.h"

@interface FactDetailsInteractor : NSObject
@property FactDetailsPresenter *factDetailsPresenter;
-(void)retrieveFactWithCompletionHandler:(void (^)(Fact *factDetails, NSError *error))completionHandler;
@end
