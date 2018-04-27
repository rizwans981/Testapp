//
//  FactDetailsRouter.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactDetailsRouter.h"
#import "FactDetailsPresenter.h"
#import "FactDetailsView.h"

@implementation FactDetailsRouter
+(UIViewController *)createFactDetailsModule
{
    FactDetailsView *factDetailsView = [[FactDetailsView alloc] init];
    
    FactDetailsPresenter *factDetailsPresenter = [[FactDetailsPresenter alloc] init];
    
    FactDetailsRouter *factDetailsRouter = [[FactDetailsRouter alloc] init];
    
    FactDetailsInteractor *factDetailsInteracter = [[FactDetailsInteractor alloc] init];
    
    factDetailsView.factDetailsPresenter = factDetailsPresenter;
    
    factDetailsPresenter.factDetailsView = factDetailsView;
    
    factDetailsPresenter.factDetailsInteracter = factDetailsInteracter;
    
    factDetailsPresenter.factDetailsRouter = factDetailsRouter;
    
    factDetailsInteracter.factDetailsPresenter = factDetailsPresenter;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:factDetailsView];
    
    return navController;
}
@end
