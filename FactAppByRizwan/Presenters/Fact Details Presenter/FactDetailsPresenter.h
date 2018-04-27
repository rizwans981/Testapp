//
//  FactDetailsPresenter.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FactDetailsView;
#import "FactDetailsRouter.h"
#import "FactDetailsInteractor.h"


@interface FactDetailsPresenter : NSObject
@property FactDetailsView *factDetailsView;
@property FactDetailsRouter *factDetailsRouter;
@property FactDetailsInteractor *factDetailsInteracter;
-(void)viewDidLoad;
@end
