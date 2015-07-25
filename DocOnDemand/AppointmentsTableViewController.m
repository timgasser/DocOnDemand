//
//  AppointmentsTableViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "AppointmentsTableViewController.h"
#import "AppDelegate.h"

#import "ApiAppointment.h"

const CGFloat headerFooterSize = 10.0f;

@interface AppointmentsTableViewController ()

@property (nonatomic, strong) NSMutableArray *appointments;

@end

@implementation AppointmentsTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appointments = [NSMutableArray array];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    AppDelegate *delegate = [AppDelegate sharedDelegate];
    
    // Build the URL request to find all appointments
    
    NSString *token = delegate.token;
    NSString *practiceString = delegate.practiceID;
    NSString *patientId = delegate.patientID;
    NSString *baseURI = delegate.baseURI;
    
// https://api.athenahealth.com/preview1/195900/patients/1/appointments
// https://api.athenahealth.com/preview1/1/195900/patients/1/appointments
    
    // API test
    // Create an NSURLRequest
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/patients/%@/appointments", baseURI, practiceString, patientId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
    
    NSLog(@"token is %@", token);
    NSLog(@"url request : %@", urlRequest);
    
    // Create the NSURLSession
    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"data = %@, response = %@, error = %@", data, response, error);
        
        
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"json string is %@", jsonString);
        
        // Convert to dictionary to pull out values
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"dictionary response is %@", dictionary);
        
        NSNumber *appointmentCountNumber = dictionary[@"totalcount"];
        NSInteger appointmentCount = [appointmentCountNumber integerValue];
        
        NSLog(@"Found %td appointments", appointmentCount);
        
        NSArray *appointmentArray = dictionary[@"appointments"];
        
        NSLog(@"appointmentArray = %@", appointmentArray);
        
        for (NSDictionary *appointment in appointmentArray) {
            
            
            ApiAppointment *newAppointment = [[ApiAppointment alloc] init];
            newAppointment.appointmentid = appointment[@"appointmentid"];
            newAppointment.appointmentstatus = appointment[@"appointmentstatus"];
            newAppointment.copay = appointment[@"copay"];
            newAppointment.date = appointment[@"date"];
            newAppointment.departmentid = appointment[@"departmentid"];
            newAppointment.providerid = appointment[@"appointmentstatus"];
            newAppointment.starttime = appointment[@"starttime"];
    
            [self.appointments addObject:newAppointment];
            
//            NSLog(@"appt is %@", appointment);
        }
        
        
        NSLog(@"appointments is %@", self.appointments);
        

        dispatch_async(
               dispatch_get_main_queue(),
               ^{
                   NSAssert([NSThread isMainThread], @"Error - _updateObjectCountLabel called on background thread");
                   [self.tableView reloadData];

               }
            );
        
        
    }];
    
    [dataTask resume];
    
    

    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.appointments count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appointmentCell" forIndexPath:indexPath];
    
    ApiAppointment *cellAppointment = [self.appointments objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellAppointment.starttime;
    cell.detailTextLabel.text = cellAppointment.date;
    
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
