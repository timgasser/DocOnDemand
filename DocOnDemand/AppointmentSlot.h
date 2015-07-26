//
//  AppointmentSlot.h
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppointmentSlot : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *appointmentId;

@end
