//
//  FactAppByRizwanTests.m
//  FactAppByRizwanTests
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FactDetailsInteractor.h"
#import "FactRowCell.h"
@interface FactsAppTests : XCTestCase
{
    NSURL *cellImageURL;
}
@property FactDetailsInteractor *factDetailsInteractor;
@property FactRowCell *factCell;
@end

@implementation FactsAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _factDetailsInteractor = [[FactDetailsInteractor alloc] init];
    cellImageURL = [NSURL URLWithString:@"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
-(void)testRetievesFactDetails
{
    //Testing Fact is retieving or not
    [_factDetailsInteractor retrieveFactWithCompletionHandler:^(Fact *factDetails, NSError *error) {
        XCTAssertNil(factDetails,"Fact details getting nil");
    }];
}
-(void)testLoadImage
{
    [_factCell downloadImageWithURL:cellImageURL completionBlock:^(BOOL succeeded, UIImage *image) {
        XCTAssertTrue(succeeded,"Image dowloaded successfully.");
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
@end
