//
//  BookingConfirmationViewController.h
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppointmentSlot.h"

@interface BookingConfirmationViewController : UIViewController

@property (nonatomic, strong) AppointmentSlot *apptSlot;

@end
