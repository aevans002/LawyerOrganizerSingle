//
//  ClientList.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientList.h"

static NSString *const NAME = @"name";
static NSString *const CASENAME = @"caseName";
static NSString *const ADDRESS = @"address";
static NSString *const SUMMARY = @"summary";
static NSString *const STARTDATE = @"startDate";

@implementation ClientList

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:NAME];
    [aCoder encodeObject:self.caseName forKey:CASENAME];
    [aCoder encodeObject:self.address forKey:ADDRESS];
    [aCoder encodeObject:self.summary forKey:SUMMARY];
    [aCoder encodeObject:self.startDate forKey:STARTDATE];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:NAME];
        _caseName = [aDecoder decodeObjectForKey:CASENAME];
        _address = [aDecoder decodeObjectForKey:ADDRESS];
        _summary = [aDecoder decodeObjectForKey:SUMMARY];
        _startDate = [aDecoder decodeObjectForKey:STARTDATE];
    }
    return self;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", _name, _caseName, _address, _summary, _startDate];
}

@end
