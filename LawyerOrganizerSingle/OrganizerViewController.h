//
//  OrganizerViewController.h
//  LawyerOrganizerSingle
//
//  Created by Administrator on 5/31/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface OrganizerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *actionList;
@property (weak, nonatomic) IBOutlet UITextField *activityField;
@property (weak, nonatomic) IBOutlet UITextField *timeField;
- (IBAction)saveAction:(id)sender;
- (IBAction)returnAction:(id)sender;

@end
