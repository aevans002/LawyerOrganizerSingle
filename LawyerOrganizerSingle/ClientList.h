//
//  ClientList.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientList : NSObject <NSCoding>

@property (nonatomic) int       id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *caseName;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *startDate;

@end
