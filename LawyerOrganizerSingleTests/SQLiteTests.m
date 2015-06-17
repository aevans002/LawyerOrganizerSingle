//
//  SQLiteTests.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/14/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ClientList.h"
#import "ClientSvcSQLite.h"

@interface SQLiteTests : XCTestCase

@end

@implementation SQLiteTests

-(void)testClientSvcSQLite {
    NSLog(@" ");
    NSLog(@"*** Starting test ***");
    
    ClientSvcSQLite *clientSvc = [[ClientSvcSQLite alloc] init];
    ClientList *client = [[ClientList alloc] init];
    client.name = @"Bob";
    client.caseName = @"Bubba";
    client.address = @"Booobba";
    client.startDate = @"Bobobo";
    client.summary = @"Tim";
    [clientSvc createClient:client];
    
    NSMutableArray *clients = [clientSvc retrievalAllClients];
    NSLog(@"*** number of clients: %i", clients.count);
    
    client.name = @"Bob2";
    client.caseName = @"Bubba2";
    client.address = @"Booobba2";
    client.startDate = @"Bobobo2";
    client.summary = @"Tim2";
    [clientSvc updateClient:client];
    
    [clientSvc deleteClient:client];
    
    NSLog(@"*** End Test ***");
    NSLog(@" ");
}

@end
