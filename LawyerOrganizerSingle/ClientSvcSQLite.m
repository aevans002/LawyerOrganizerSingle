//
//  ClientSvcSQLite.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 6/14/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientSvcSQLite.h"
#import "sqlite3.h"

@implementation ClientSvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;

-(id)init {
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDir = [documentPaths objectAtIndex:0];
        databasePath = [documentDir stringByAppendingPathComponent:@"client.sqlite3"];
        
        if (sqlite3_open([databasePath UTF8String], &database)== SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
        } else {
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}


-(ClientList *) createClient:(ClientList *)client {
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO client (name, caseName, address, date, summary) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", client.name, client.caseName, client.address, client.summary, client.startDate];
    
    if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL) ==SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            client.id = sqlite3_last_insert_rowid(database);
            NSLog(@"***Client added");
        } else {
            NSLog(@"*** Client not added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return client;
}

-(NSMutableArray *) retrievalAllClients {
    NSMutableArray *clients = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM client ORDER BY name"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Clients retrieved");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int id = sqlite3_column_int(statement, 0);
            char *nameChars = (char *)sqlite3_column_text(statement, 1);
            char *caseChars = (char *)sqlite3_column_text(statement, 2);
            char *addressChars = (char *)sqlite3_column_text(statement, 3);
            char *dateChars = (char *)sqlite3_column_text(statement, 4);
            char *summaryChars = (char *)sqlite3_column_text(statement, 5);
            
            ClientList *client = [[ClientList alloc] init];
            client.id = id;
            client.name = [[NSString alloc] initWithUTF8String:nameChars];
            client.caseName = [[NSString alloc] initWithUTF8String:caseChars];
            client.address = [[NSString alloc] initWithUTF8String:addressChars];
            client.startDate = [[NSString alloc] initWithUTF8String:dateChars];
            client.summary = [[NSString alloc] initWithUTF8String:summaryChars];
            [clients addObject:client];
            
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"*** Clients NOT retrieved");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
    return clients;
}

-(ClientList *) updateClient:(ClientList *)client {
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE client SET name=\"%@\", caseName=\"%@\", address=\"%@\", date=\"%@\", summary=\"%@\" WHERE id = %i ", client.name, client.caseName, client.address, client.startDate, client.summary, client.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Client updated");
        } else {
            NSLog(@"*** Client not updated");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return client;
}

-(ClientList *) deleteClient:(ClientList *)client {
    NSString *updateSQL = [NSString stringWithFormat:@"DELETE FROM client WHERE id = %i", client.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Client deleted");
        } else {
            NSLog(@"*** Client not deleted");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return client;
}

- (void) dealloc {
    sqlite3_close(database);
}

@end
