//
//  LawyerOrganizerSingleTests.m
//  LawyerOrganizerSingleTests
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ClientList.h"
#import "ClientSvcArchive.h"

@interface LawyerOrganizerSingleTests : XCTestCase

@end

@implementation LawyerOrganizerSingleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testClientSvcArchive
{
    NSLog(@"Starting Test");
    ClientSvcArchive *clientSvc = [[ClientSvcArchive alloc]init];
    
    ClientList *client = [[ClientList alloc] init];
    client.name = @"Bob";
    client.caseName = @"Derp";
    client.address = @"Here";
    client.startDate = @"Now";
    client.summary = @"It Happened";
    
    [clientSvc createClient:(ClientList *) client];
    int count = [[clientSvc retrievalAllClients] count];
    
    NSLog(@" Count %i", count);
    NSLog(@" End Test");
    
}

@end
