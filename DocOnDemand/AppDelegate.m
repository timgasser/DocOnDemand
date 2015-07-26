//
//  AppDelegate.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "AppDelegate.h"
#import "AthenaAPI.h"


@interface AppDelegate ()



@end

@implementation AppDelegate


// Class method to get the App Delegate (used to access the Root MOC)
+ (instancetype)sharedDelegate;
{
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    NSAssert([delegate isKindOfClass:[AppDelegate class]], @"Expected to use our app delegate class");
    return (AppDelegate *) delegate;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#pragma warning - This token is only valid for 1 hour ! Remember to renew !

    self.token = @"fspzmn57u83a3q2n52epxgsg";
    self.practiceID = @"195900";
    self.patientID = @"4918";
    self.baseURI = @"https://api.athenahealth.com/preview1";
    self.departmentID = @"145";
    
    
    UIColor *barColor = [UIColor colorWithRed:136/255.0f green:197/255.0f blue:92/255.0f alpha:1.0f];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:barColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTranslucent:true];
    
    
    [[UITabBar appearance] setTintColor:barColor];

    


//    // Token request code
//    
//    
//// Use POST
////    https://api.athenahealth.com/oauthpreview/token
//// username=key and password=secret
//    
//    
//    NSMutableString *baseToken = [NSMutableString  stringWithFormat:@"https://api.athenahealth.com/oauthpreview/token?grant_type=client_credentials"];
//
//    NSURL *url = [NSURL URLWithString:baseToken];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
//
//    NSString *authStr = [NSString stringWithFormat:@"%@:%@", clientID, clientSecret];
//    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *authValue = [NSString stringWithFormat: @"Basic %@",[authData base64EncodedStringWithOptions:0]];
//    [urlRequest setValue:authValue forHTTPHeaderField:@"Authorization"];
//    [urlRequest addValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded"] forHTTPHeaderField:@"Content-Type"];
////    [urlRequest addValue:[NSString stringWithFormat:@"client_credentials"] forHTTPHeaderField:@"grant_type"];
//    urlRequest.HTTPMethod = @"POST";
//
////  "grant_type=client_credentials"
//    
//        NSLog(@"url request : %@", urlRequest);
//    
//    // Create the NSURLSession
//    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
//    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//                                                    NSLog(@"data = %@, response = %@, error = %@", data, response, error);
//                                                    
//                                                    
//                                                    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                                            NSLog(@"json string is %@", jsonString);
//                                                    
//                                                    // Convert to dictionary to pull out values
//                                                    
//                                                    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                                                    //        NSLog(@"dict response is %@", responseDictionary);
//                                                    
//                                                    NSArray *responseArray = responseDictionary[@"appointments"];
//                                                    NSLog(@"found %tu appts", [responseArray count]);
//                                                    
//                                                    //        self.apptSlots = nil;
//                                                    
//                                                }];
//    
//    
//    [dataTask resume];
//    

    
    //----- end !
    
    
    
    // todo add a token renewal method here, callable from anywhere
    
    // Show the login confirmation screen
//    [self.window.rootViewController performSegueWithIdentifier:@"loginSegue" sender:self];
    
    
//    NSString *exampleHostString = @"https://api.athenahealth.com/preview1/1/practiceinfo";
//
//    
//    // API test
//    // Create an NSURLRequest
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/practiceinfo", baseURI]];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
//    [urlRequest addValue:@"Bearer 4rtcfuektbtkg8cjakfzansf" forHTTPHeaderField:@"Authorization"];
//    
//    NSLog(@"url request : %@", urlRequest);
//    
//    // Create the NSURLSession
//    NSURLSessionConfiguration *ephemeralConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:ephemeralConfig];
//    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        NSLog(@"data = %@, response = %@, error = %@", data, response, error);
//        
//        
//        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"json string is %@", jsonString);
//        
//        // Convert to dictionary to pull out values
//        
//        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSLog(@"dictionary response is %@", dictionary);
//        
//        
//        NSInteger practiceId = (NSInteger ) dictionary[@"practiceinfo"][0][@"practiceid"];
//
//        NSLog(@"practice id = %td", practiceId);
//        
//        
//        
//        
//    
//        
//    }];
//    
//    [dataTask resume];
//    
//    
//
    
    
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
