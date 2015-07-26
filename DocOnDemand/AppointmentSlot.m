//
//  AppointmentSlot.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "AppointmentSlot.h"

@implementation AppointmentSlot


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.date = @"";
        self.time = @"";
        self.appointmentId = @"";
    }
    return self;
}
@end
