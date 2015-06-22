//
//  ClientViewController.m
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import "ClientViewController.h"
#import "ViewController.h"
#import "Client.h"
#import "ClientList.h"
//#import "ClientSvcCache.h"
//#import "ClientSvcArchive.h"
//#import "ClientSvcSQLite.h"
#import "ClientSvcCoreData.h"



@interface ClientViewController ()

@end

@implementation ClientViewController

//ClientSvcCache *clientSvc = nil;
//ClientSvcArchive *clientSvc = nil;
//ClientSvcSQLite *clientSvc = nil;
ClientSvcCoreData *clientSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //clientSvc = [[ClientSvcCache alloc]init];
    //clientSvc = [[ClientSvcArchive alloc] init];
    //clientSvc = [[ClientSvcSQLite alloc] init];
    clientSvc = [[ClientSvcCoreData alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveClient:(id)sender {
    NSLog(@"saveClient: entering");
    
    [self.view endEditing:YES];
    ClientList *client = [[ClientList alloc] init];
    client.name = _name.text;
    client.caseName = _caseName.text;
    client.address = _address.text;
    client.summary = _summary.text;
    client.startDate = _startDate.text;
    [clientSvc createClient:client];
    
    [self.tableView reloadData];
    NSLog(@"saved pressed");
}

- (IBAction)deleteClient:(id)sender {
    NSLog(@"deleteClient");
    
    [self.view endEditing:YES];
    
    NSLog(@"delete pressed");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[clientSvc retrievalAllClients] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Client *client = [[clientSvc retrievalAllClients] objectAtIndex:indexPath.row];
    cell.textLabel.text = client.name;
    return cell;
}

@end
