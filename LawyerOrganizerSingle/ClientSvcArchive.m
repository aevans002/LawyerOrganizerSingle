//
//  ClientSvcArchive.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/7/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientSvcArchive.h"

@implementation ClientSvcArchive

NSString *filePath;
NSMutableArray *newClients;

- (id) init {
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Clients.archive"]];
    [self readArchive];
    return self;
}

- (void) readArchive {
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:filePath]) {
        newClients = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    } else
    {
        newClients = [NSMutableArray array];
    }
    
}

- (void) writeArchive {
    [NSKeyedArchiver archiveRootObject:newClients toFile:filePath];
    
}

- (ClientList *) createClient:(ClientList *)client {
    NSLog(@"ClientListSvc.createClient: %@", [client description]);
    
    [newClients addObject:client];
    [self writeArchive];
    return client;
}

- (NSMutableArray *) retrievalAllClients {
    return newClients;
}

- (ClientList *) updateClient:(ClientList *)client {
    return client;
}

- (ClientList *) deleteClient:(ClientList *)client {
    return client;
}

@end
