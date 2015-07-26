//
//  ApptNavigationViewController.m
//  DocOnDemand
//
//  Created by Tim Gasser on 7/26/15.
//  Copyright (c) 2015 timgsr. All rights reserved.
//

#import "ApptNavigationViewController.h"

@interface ApptNavigationViewController ()

@end

@implementation ApptNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"ApptIconSolid"];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
