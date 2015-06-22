//
//  ClientSvcCoreData.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/14/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientSvcCoreData.h"
#import "ClientList.h"
//#import <CoreData/CoreData.h>

@implementation ClientSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

-(id) init {
    if (self = [super init]) {
        [self initializeCoreData];
        return self;
    }
    return nil;
}



- (Client *) createManagedClient {
    Client *client = [NSEntityDescription insertNewObjectForEntityForName:@"Client" inManagedObjectContext:moc];
    return client;
}

- (ClientList *) createClient: (ClientList *) client {
    NSLog(@"Entered create Client");
    Client *managedClient = [self createManagedClient];
    managedClient.name = client.name;
    managedClient.caseName = client.caseName;
    managedClient.address = client.address;
    managedClient.date = client.startDate;
    managedClient.summary = client.summary;
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"create client ERROR: %@", [error localizedDescription]);
    }
    return managedClient;
}

-(NSArray *) retrievalAllClients {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}

-(Client *) updateClient:(Client *)client {
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"updateClient ERROR: %@", [error localizedDescription]);
    }
    return client;
}

- (Client *) deleteClient:(Client *)client {
    [moc deleteObject:client];
    return client;
}

- (void) initializeCoreData
{
    // init the schema model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    //init the persistent stor coordinator with model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"Client.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        //init the managed object context
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else {
        NSLog(@"init Core Data failed with error: %@", error);
    }
}

/*
 
 -(Client *) createClient:(Client *)client {
 
 NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Client" inManagedObjectContext:moc];
 [managedObject setValue:client.name forKey:@"name"];
 [managedObject setValue:client.caseName forKey:@"caseName"];
 [managedObject setValue:client.address forKey:@"address"];
 [managedObject setValue:client.date forKey:@"date"];
 [managedObject setValue:client.summary forKey:@"summary"];
 NSError *error;
 if (![moc save:&error]) {
 NSLog(@"createClient ERROR: %@", [error localizedDescription]);
 }
 return client;
 }
 
 -(NSArray *) retrievalAllClients {
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
 NSEntityDescription *entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:moc];
 [fetchRequest setEntity:entity];
 NSError *error;
 NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
 NSMutableArray *clients = [NSMutableArray arrayWithCapacity:fetchedObjects.count];
 for (NSManagedObject *managedObject in fetchedObjects) {
 Client *client = [[Client alloc] init];
 client.name = [managedObject valueForKey:@"name"];
 client.caseName = [managedObject valueForKey:@"caseName"];
 client.address = [managedObject valueForKey:@"address"];
 client.date = [managedObject valueForKey:@"date"];
 client.summary = [managedObject valueForKey:@"summary"];
 NSLog(@"client: %@ ", [client description]);
 [clients addObject:client];
 }
 return clients;
 }
 
 -(Client *) updateClient:(Client *)client {
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
 NSEntityDescription *entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:moc];
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@name = %@ AND caseName = %@ AND address %@ AND date %@ AND summary %@", client.name, client.caseName, client.address, client.date, client.summary];
 [fetchRequest setPredicate:predicate];
 [fetchRequest setEntity:entity];
 NSError *error;
 NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
 return client;
 }
 
 -(Client *) deleteClient:(Client *)client {
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
 NSEntityDescription *entity = [NSEntityDescription entityForName:@"Client" inManagedObjectContext:moc];
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@name = %@ AND caseName = %@ AND address %@ AND date %@ AND summary %@", client.name, client.caseName, client.address, client.date, client.summary];
 [fetchRequest setPredicate:predicate];
 [fetchRequest setEntity:entity];
 NSError *error;
 NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
 
 if ([fetchedObjects count] == 1) {
 NSManagedObject *managedObject = [fetchedObjects objectAtIndex:0];
 [moc deleteObject:managedObject];
 }
 return client;
 }
 */

@end
