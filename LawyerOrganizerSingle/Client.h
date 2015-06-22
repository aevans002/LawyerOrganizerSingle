//
//  Client.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/21/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Client : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * caseName;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * summary;

@end
