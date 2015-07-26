//
//  BookingConfirmationViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "BookingConfirmationViewController.h"

#import "AppDelegate.h"

@interface BookingConfirmationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *confirmationLabel;

@end

@implementation BookingConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    AppDelegate *delegate = [AppDelegate sharedDelegate];
    
    // Build the URL request to find all appointments
    
    NSString *token = delegate.token;
    NSString *practiceString = delegate.practiceID;
    NSString *patientId = delegate.patientID;
    NSString *baseURI = delegate.baseURI;
    NSString *deptId = delegate.departmentID;
    NSString *apptId = self.apptSlot.appointmentId;

    // https://api.athenahealth.com/preview1/195900/appointments/370298?appointmenttypeid=82&ignoreschedulablepermission=false&patientid=1

    
    
    // API test
    // Create an NSURLRequest
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@/%@/appointments/%@?", baseURI, practiceString, apptId];
    [urlString appendFormat:@"&patientid=%@", patientId];
    [urlString appendFormat:@"&appointmenttypeid=%@", @"82"];
    [urlString appendString:@"&ignoreschedulablepermission=false"];

    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest addValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
    //    [urlRequest addValue:@"application/x-www-url-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    urlRequest.HTTPMethod = @"PUT";

    
    NSLog(@"token is %@", token);
    NSLog(@"url request : %@", urlRequest);
    
    // Create the NSURLSession
    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"data = %@, response = %@, error = %@", data, response, error);
        
        
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"json string is %@", jsonString);
        
        // Convert to dictionary to pull out values
        
//        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSLog(@"dict response is %@", responseDictionary);
//        
//        NSArray *responseArray = responseDictionary[@"appointments"];
//        NSLog(@"found %tu appts", [responseArray count]);
        dispatch_async(
               dispatch_get_main_queue(),
               ^{
                   self.confirmationLabel.text = @"Confirming appointment ... done !";
                   
               }
);
        
    }];
    
    
    [dataTask resume];
    
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

@end
