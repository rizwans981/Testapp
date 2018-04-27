//
//  Fact.h
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fact : NSObject
@property NSString *title;
@property NSMutableArray *rows;
-(Fact *)initWithDetails:(NSDictionary *)detailsDict;
@end
