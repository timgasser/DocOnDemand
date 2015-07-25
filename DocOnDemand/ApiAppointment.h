//
//  ApiAppointment.h
//  DocOnDemand
//
//  Created by Tim Gasser on 7/25/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//
//"appointments": [{
//    "date": "07\/27\/2015",
//    "copay": 0,
//    "appointmentid": "368527",
//    "starttime": "09:00",
//    "departmentid": "1",
//    "providerid": "71",
//    "appointmentstatus": "f"

@interface ApiAppointment : NSObject

    
@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSString *copay;
@property (nonatomic, assign) NSString *appointmentid;
@property (nonatomic, strong) NSString *starttime;
@property (nonatomic, assign) NSString *departmentid;
@property (nonatomic, assign) NSString *providerid;
@property (nonatomic, assign) NSString *appointmentstatus;

    
@end
