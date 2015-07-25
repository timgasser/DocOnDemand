//
//  ApiUser.h
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiUser : NSObject


@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *dateOfBirth;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *patientID;



@end
