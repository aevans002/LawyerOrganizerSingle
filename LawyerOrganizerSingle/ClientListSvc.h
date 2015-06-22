//
//  ClientListSvc.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

@protocol ClientListSvc <NSObject>

- (Client *) createClient: (Client *) client;
- (NSArray *) retrievalAllClients;
- (Client *) updateClient: (Client *) client;
- (Client *) deleteClient: (Client *) client;

@end
