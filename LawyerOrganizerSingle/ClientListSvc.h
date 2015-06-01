//
//  ClientListSvc.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientList.h"

@protocol ClientListSvc <NSObject>

- (ClientList *) createClient: (ClientList *) client;
- (NSMutableArray *) retrievalAllClients;
- (ClientList *) updateClient: (ClientList *) client;
- (ClientList *) deleteClient: (ClientList *) client;

@end
