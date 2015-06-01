//
//  ClientViewController.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface ClientViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *caseName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *summary;
@property (weak, nonatomic) IBOutlet UITextField *startDate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)saveClient:(id)sender;
- (IBAction)deleteClient:(id)sender;
@end
