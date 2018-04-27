//
//  FactRow.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactRow : NSObject
@property NSString *title;
@property NSString *descriptionDetails;
@property NSString *imageURL;
-(FactRow *)initWithDetails:(NSDictionary *)detailsDict;
@end
