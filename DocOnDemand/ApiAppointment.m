//
//  ApiAppointment.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "ApiAppointment.h"

@implementation ApiAppointment


-(instancetype)init
{
    self = [super init];
    if (self) {
        
        // Init all the fields to empty strings here
        self.date = @"";
        self.copay = @"";
        self.appointmentid = @"";
        self.starttime = @"";
        self.departmentid = @"";
        self.providerid = @"";
        self.appointmentstatus = @"";

    }
    return self;
}

@end
