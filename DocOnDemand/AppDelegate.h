//
//  AppDelegate.h
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedDelegate;



@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *practiceID;
@property (nonatomic, strong) NSString *patientID;
@property (nonatomic, strong) NSString *baseURI;


@end

