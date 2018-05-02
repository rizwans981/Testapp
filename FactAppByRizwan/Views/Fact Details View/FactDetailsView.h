//
//  FactDetailsView.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fact.h"
@class FactDetailsPresenter;

@interface FactDetailsView : UITableViewController

@property FactDetailsPresenter *factDetailsPresenter;

-(void)showLoading;

-(void)hideLoading;

-(void)showFactDetails:(Fact *)factDetails;

-(void)showAlertController;
@end
