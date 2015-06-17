//
//  ClientSvcCoreData.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/14/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientSvcCoreData.h"
#import <CoreData/CoreData.h>

@implementation ClientSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

-(id) init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

-(ClientList *) createClient:(ClientList *)client {
    return client;
}

-(NSMutableArray *) retrievalAllClients {
    return nil;
}

-(ClientList *) updateClient:(ClientList *)client {
    return client;
}

-(ClientList *) deleteClient:(ClientList *)client {
    return client;
}

@end
