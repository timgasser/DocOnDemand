//
//  LabelTextEntryTableViewCell.h
//  bermuda
//
//  Created by Tim Gasser on 5/5/15.
//  Copyright (c) 2015 Tim Gasser. All rights reserved.
//

#import <UIKit/UIKit.h>



// Implement a delegate protocol to relay key UITextFieldDelegate messages
// back to the tableview using the cell

@protocol LabelTextEntryTableViewCellDelegate <NSObject>

@optional

//-(BOOL)textEntryTableViewCellShouldReturn:(UITextField *)textField;
//
//-(BOOL)textEntryTableViewCell:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (void)textEntryDidChange:(NSString *)string forIdentifier:(NSString *)identifier;


- (void)selectedTextFieldForIdentifier:(NSString *)identifier;


@end



@interface LabelTextEntryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITextField *textField;


// Delegate property
@property (nonatomic, weak) id<LabelTextEntryTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSString *identifier;


@end
