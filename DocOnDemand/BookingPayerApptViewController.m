//
//  BookingPayerApptViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "BookingPayerApptViewController.h"

@interface BookingPayerApptViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *payerPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *apptPicker;

@property (nonatomic, strong) NSArray *payerArray;
@property (nonatomic, strong) NSArray *apptArray;


@end

@implementation BookingPayerApptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.payerArray = @[ @"Tennessee",
                         @"Blue Cross Blue Shield of Texas",
                         @"Blue Cross Blue Shield of Illinois",
                         @"Blue Cross Blue Shield of Michigan",
                         @"Cigna",
                         @"Aetna",
                         @"Anthem Bluecross Blueshield",
                         @"MedicareBlue Cross Blue Shield"
                         ];
    
    
    self.apptArray = @[ @"Allergy Test",
                        @"Any 15",
                        @"Cardiology",
                        @"Consult",
                        @"Established Visit",
                        @"Jchase test",
                        @"Lab Testing",
                        @"Lab Work",
                        @"Medicare Annual Wellness Visit",
                        @"New Evaluation",
                        @"New OB",
                        @"New Patient Appointment",
                        @"OPEN",
                        @"Office Visit",
                        @"PHYSICAL",
                        @"Physical Exam Visit",
                        @"ReminderCall Default",
                        @"Sea Sickness",
                        @"Surgery (time is not correct)",
                        @"Web Scheduling",
                        @"New Patient Web Schedule",
                        @"Weigh Forward 1",
                        @"Weigh Forward 2",
                        @"Weigh Forward 3",
                        @"Weigh Forward Any",
                        @"health history",
                        @"test appt"
                        ];
    
    
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


#pragma mark - <UIPickerViewDataSource>

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    if (pickerView == self.payerPicker) {
        return 1;
    } else if (pickerView == self.apptPicker) {
        return 1;
    }
    
    return -1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    if (pickerView == self.payerPicker) {
        return [self.payerArray count];
    } else if (pickerView == self.apptPicker) {
        return [self.apptArray count];
    }
    
    return -1;

    
    
}



#pragma mark - <UIPickerViewDelegate>


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    
    if (pickerView == self.payerPicker) {
        return [self.payerArray objectAtIndex:row];
    } else if (pickerView == self.apptPicker) {
        return [self.apptArray objectAtIndex:row];
    }
    
    return @"";

    
    
}

- (IBAction)unwindToBookings:(UIStoryboardSegue*)sender
{
    UIViewController *sourceViewController = sender.sourceViewController;
    
}


@end
