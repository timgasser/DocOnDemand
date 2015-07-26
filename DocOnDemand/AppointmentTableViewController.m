//
//  AppointmentTableViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "AppointmentTableViewController.h"

#import "AppDelegate.h"

#import "AppointmentSlot.h"

#import "BookingConfirmationViewController.h"

@interface AppointmentTableViewController ()

@property (nonatomic, strong) NSMutableArray *apptSlots;

@end

@implementation AppointmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.apptSlots = [NSMutableArray array];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.apptSlots removeAllObjects];
    
    AppDelegate *delegate = [AppDelegate sharedDelegate];
    
    // Build the URL request to find all appointments
    
    NSString *token = delegate.token;
    NSString *practiceString = delegate.practiceID;
    //    NSString *patientId = delegate.patientID;
    NSString *baseURI = delegate.baseURI;
    NSString *deptId = delegate.departmentID;
    
    // https://api.athenahealth.com/preview1/195900/patients
    
//https://api.athenahealth.com/preview1/195900/appointments/open?appointmenttypeid=282&bypassscheduletimechecks=true&departmentid=145&enddate=12%2F25%2F2015&ignoreschedulablepermission=true&reasonid=-1&showfrozenslots=false&startdate=01%2F01%2F2015

    
    // API test
    // Create an NSURLRequest
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@/%@/appointments/open?", baseURI, practiceString];
    [urlString appendFormat:@"appointmenttypeid=282"];
    [urlString appendFormat:@"&departmentid=145"];
    [urlString appendFormat:@"&startdate=07/26/2015"];
    [urlString appendFormat:@"&enddate=08/01/2015"]; // Change if too many results come back
    [urlString appendFormat:@"&reasonid=-1"];
    

    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
    //    [urlRequest addValue:@"application/x-www-url-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    urlRequest.HTTPMethod = @"GET";
    
    
    NSLog(@"token is %@", token);
    NSLog(@"url request : %@", urlRequest);
    
    // Create the NSURLSession
    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
//        NSLog(@"data = %@, response = %@, error = %@", data, response, error);
        
        
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"json string is %@", jsonString);
        
        // Convert to dictionary to pull out values
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSLog(@"dict response is %@", responseDictionary);
        
        NSArray *responseArray = responseDictionary[@"appointments"];
        NSLog(@"found %tu appts", [responseArray count]);
        
//        self.apptSlots = nil;
        
        for (NSDictionary *currentAppt in responseArray) {

            AppointmentSlot *newSlot = [[AppointmentSlot alloc] init];
            newSlot.date = currentAppt[@"date"];
            newSlot.time = currentAppt[@"starttime"];
            newSlot.appointmentId = currentAppt[@"appointmentid"];
            NSLog(@"current appt is %@", currentAppt);

        
            [self.apptSlots addObject:newSlot];
        }
        
//        NSLog(@"apptSlots = %@", self.apptSlots);
        
        dispatch_async(
                       dispatch_get_main_queue(),
                       ^{
                           [self.tableView reloadData];
                       }
                       );
        
        
    }];
    
    [dataTask resume];
    
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.apptSlots count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"apptSlotCell" forIndexPath:indexPath];
    

    AppointmentSlot *cellSlot = [self.apptSlots objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellSlot.time;
    cell.detailTextLabel.text = cellSlot.date;
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    
        NSAssert([segue.destinationViewController isKindOfClass:[UINavigationController class]],
                 @"Error - expected UINavigation class for segue destination, got %@", segue.destinationViewController);
        UINavigationController *navigationController = (UINavigationController *) segue.destinationViewController;
        
        
        NSAssert([navigationController.topViewController isKindOfClass:[BookingConfirmationViewController class]],
                 @"Error - expected destination view controller BookingConfirmationViewController, got %@", navigationController.topViewController);
        BookingConfirmationViewController *bookingConfirmationViewController = (BookingConfirmationViewController *) navigationController.topViewController;
        
        
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        NSInteger selectedRow = selectedPath.row;
        
        AppointmentSlot *chosenSlot = [self.apptSlots objectAtIndex:selectedRow];
        
        bookingConfirmationViewController.apptSlot = chosenSlot;


    NSLog(@"booking conf VC appt slot is %@", bookingConfirmationViewController.apptSlot);
}


@end
