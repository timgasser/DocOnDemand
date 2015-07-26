//
//  UserTableViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "UserTableViewController.h"

#import "LabelTextEntryTableViewCell.h"

#import "ApiUser.h"

#import "AppDelegate.h"

const CGFloat headerFooterSize = 10.0f;


@interface UserTableViewController () <LabelTextEntryTableViewCellDelegate>

- (IBAction)saveButtonPressed:(id)sender;

@property (nonatomic, strong) ApiUser *apiUser;

//@property (nonatomic, strong) NSString *patientID;

@end

@implementation UserTableViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCustomTableViewCells];
    
//    self.patientID = @"";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    if (section == 0) {
        return 5;
    } else if (section == 1) {
        return 3;
    } else {
        return 1;
    }

}


// Rows
//------
// 0 - First name
// 1 - Last Name
// 2 - DOB
// 3 - Email
// 4 - Phone
//------
// 5 - Address1
// 6 - Address2
// 7 - City
//-------
// 8 - Patient ID

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LabelTextEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelTextEntryCell" forIndexPath:indexPath];
    
    // Global cell settings
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    NSInteger comparisonRow = (indexPath.section * 10) + indexPath.row;
    
    NSLog(@"comparisonRow = %td", comparisonRow);
    
    switch (comparisonRow) {
        case 0: {
            cell.identifier = @"firstName";
            cell.label.text = NSLocalizedString(@"First Name", nil);
            cell.textField.placeholder = @"John";
            cell.textField.text = @"John";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            [cell.textField becomeFirstResponder];
            return cell;
    }
        case 1: {
            cell.identifier = @"lastName";
            cell.label.text = NSLocalizedString(@"Last Name", nil);
            cell.textField.placeholder = @"Doe";
            cell.textField.text = @"Doe";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;
        }
        case 2: {
            cell.identifier = @"dateOfBirth";
            cell.label.text = NSLocalizedString(@"Date of Birth", nil);
            cell.textField.placeholder = @"mm/dd/yy";
            cell.textField.text = @"05/10/62";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 3: {
            cell.identifier = @"email";
            cell.label.text = NSLocalizedString(@"Email", nil);
            cell.textField.placeholder = @"john.doe@gmail.com";
            cell.textField.text = @"john.doe@gmail.com";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 4: {
            cell.identifier = @"phone";
            cell.label.text = NSLocalizedString(@"Phone", nil);
            cell.textField.placeholder = @"1234567890";
            cell.textField.text = @"5128393726";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 10: {
            cell.identifier = @"address1";
            cell.label.text = NSLocalizedString(@"Address 1", nil);
            cell.textField.placeholder = @"800 West 6th St";
            cell.textField.text = @"800 West 6th St";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 11: {
            cell.identifier = @"city";
            cell.label.text = NSLocalizedString(@"City", nil);
            cell.textField.placeholder = @"Austin";
            cell.textField.text = @"Austin";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 12: {
            cell.identifier = @"state";
            cell.label.text = NSLocalizedString(@"State", nil);
            cell.textField.placeholder = @"TX";
            cell.textField.text = @"TX";
            cell.textField.enabled = true;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
        case 20: {
            cell.identifier = @"patientID";
            cell.label.text = NSLocalizedString(@"Patient ID", nil);
            AppDelegate *delegate = [AppDelegate sharedDelegate];

            cell.textField.text = delegate.patientID;
            cell.textField.enabled = false;
            cell.textField.keyboardType = UIKeyboardTypeAlphabet;
            cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            return cell;

        }
            
        default:
            break;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Helper functions
// todo ! Clean up unused table view cells
- (void)registerCustomTableViewCells;
{
    // Register the custom cells from their nibs
    UINib *labelTextEntryCellNib = [UINib nibWithNibName:@"LabelTextEntryTableViewCell" bundle:nil];
    
    //    // DLog(@"timeEntryCellNib is %@", timeEntryCellNib);
    [self.tableView registerNib:labelTextEntryCellNib forCellReuseIdentifier:@"labelTextEntryCell"];
    
}

// address1=address1&city=city&departmentid=1&dob=dob&email=email&firstname=firstname&lastname=lastname&mobilephone=phone&state=state&zip=78787


- (IBAction)saveButtonPressed:(id)sender
{
    NSLog(@"pressed Save");
    
    LabelTextEntryTableViewCell *cell = nil;
    
    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *firstName = cell.textField.text;
    
    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    NSString *lastName = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    NSString *dob = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    NSString *email = cell.textField.text;
    
    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    NSString *phone = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    NSString *address1 = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    NSString *city = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
    NSString *state = cell.textField.text;

    cell = (LabelTextEntryTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    NSString *patientId = cell.textField.text;
    

    
//    NSString *firstName = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].textLabel.text;
//    NSString *lastName  = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].textLabel.text;
//    NSString *dob       = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]].textLabel.text;
//    NSString *email     = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:3]].textLabel.text;
//    NSString *phone     = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:4]].textLabel.text;
//    NSString *address1  = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]].textLabel.text;
//    NSString *city      = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].textLabel.text;
//    NSString *state     = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]].textLabel.text;
//    NSString *patientId = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]].textLabel.text;
    
    AppDelegate *delegate = [AppDelegate sharedDelegate];
    
    // Build the URL request to find all appointments
    
    NSString *token = delegate.token;
    NSString *practiceString = delegate.practiceID;
//    NSString *patientId = delegate.patientID;
    NSString *baseURI = delegate.baseURI;
    NSString *deptId = delegate.departmentID;
    
    // https://api.athenahealth.com/preview1/195900/patients
    
    // API test
    // Create an NSURLRequest
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/patients", baseURI, practiceString];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
//    [urlRequest addValue:@"application/x-www-url-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    urlRequest.HTTPMethod = @"POST";

    address1 = [address1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // Build up the huge string with all the information
    NSMutableString *httpBody = [NSMutableString string ];
//    [httpBody appendString:[NSString stringWithFormat:@"departmentid=%@", deptId]];
    [httpBody appendString:[NSString stringWithFormat:@"address1=%@", address1]];
//    [httpBody appendString:[NSString stringWithFormat:@"&address2="];
    [httpBody appendString:@"&departmentid=145"];
    [httpBody appendString:[NSString stringWithFormat:@"&dob=%@", dob]];
    [httpBody appendString:[NSString stringWithFormat:@"&email=%@", email]];
    [httpBody appendString:[NSString stringWithFormat:@"&firstname=%@", firstName]];
    [httpBody appendString:[NSString stringWithFormat:@"&lastname=%@", lastName]];

    [httpBody appendString:[NSString stringWithFormat:@"&homephone=%@", phone]];
//    [httpBody appendString:@"&mobilephone=1234567890"];
    [httpBody appendString:[NSString stringWithFormat:@"&state=%@", state]];
    [httpBody appendString:[NSString stringWithFormat:@"&city=%@", city]];

    // Fixed section
//    [httpBody appendString:[NSString stringWithFormat:@"departmentid=%@", deptId]];

    // Variable section
    
//    [httpBody appendString:[NSString stringWithFormat:@"firstname=%@", firstName]];
//    [httpBody appendString:[NSString stringWithFormat:@"&lastname=%@", lastName]];
//    [httpBody appendString:[NSString stringWithFormat:@"&dob=%@", dob]];
//    [httpBody appendString:[NSString stringWithFormat:@"&email=%@", email]];
//    [httpBody appendString:[NSString stringWithFormat:@"&phone=%@", phone]];
//    [httpBody appendString:[NSString stringWithFormat:@"&address1=%@", address1]];
//    [httpBody appendString:[NSString stringWithFormat:@"&address2=%@", @"address2"]];
//
//    [httpBody appendString:[NSString stringWithFormat:@"&city=%@", city]];
//    [httpBody appendString:[NSString stringWithFormat:@"&state=%@", city]];
//    [httpBody appendString:[NSString stringWithFormat:@"&homephone=%@", @"1234567890"]];


    

    
    
    
    
//    NSString *httpBody =@"address1=address+1&address2=address+2&departmentid=145&dob=04%2F10%2F62&email=declined&firstname=firstname&homephone=1234567890&lastname=lastname&mobilephone=1234567890&state=TX&zip=78722";
    NSLog(@"http body is %@", httpBody);
    urlRequest.HTTPBody = [httpBody dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"token is %@", token);
    NSLog(@"url request : %@", urlRequest);
    
    // Create the NSURLSession
    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"data = %@, response = %@, error = %@", data, response, error);
        
        
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"json string is %@", jsonString);
        
        // Convert to dictionary to pull out values
        
        NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"array response is %@", responseArray);
        
        NSDictionary *responseDictionary = responseArray[0];

        AppDelegate *delegate = [AppDelegate sharedDelegate];
        delegate.patientID = responseDictionary[@"patientid"];
        
        dispatch_async(
               dispatch_get_main_queue(),
               ^{
                   [self.tableView reloadData];
               }
);
        
        
    }];
    
    [dataTask resume];
    
    

    
    
    
}


// Tune the gap between groups in the tableview here
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return headerFooterSize;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return headerFooterSize * 2.0f;
    } else {
        return headerFooterSize;
    }
}


@end
