//
//  ApiPatient.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "ApiPatient.h"

@implementation ApiPatient




-(instancetype)init
{
    self = [super init];
    if (self) {
        
        self.firstName = @"";
        self.lastName = @"";
        self.dob = @"";
        self.email = @"";
        self.phone = @"";
        self.address1 = @"";
        self.city = @"";
        self.state = @"";
        self.patientId = @"";

        // Custom initialisation here ..
    }
    return self;
}


@end
