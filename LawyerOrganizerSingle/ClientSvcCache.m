//
//  ClientSvcCache.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientSvcCache.h"

@implementation ClientSvcCache

NSMutableArray *clients = nil;

- (id) init {
    if (self = [super init]) {
        clients = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (ClientList *) createClient:(ClientList *)client {
    
    [clients addObject:client];
    return client;
}

- (NSMutableArray *) retrievalAllClients {
    
    return clients;
    
}

- (ClientList *) updateClient:(ClientList *)client {
    
    return client;
    
}

- (ClientList *) deleteClient:(ClientList *)client {
    return client;
}

@end

