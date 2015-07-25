//
//  LabelTextEntryTableViewCell.m
//  bermuda
//
//  Created by Tim Gasser on 5/5/15.
//  Copyright (c) 2015 Tim Gasser. All rights reserved.
//

#import "LabelTextEntryTableViewCell.h"

@interface LabelTextEntryTableViewCell () <UITextFieldDelegate>

@end


@implementation LabelTextEntryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.textField.delegate = self;

}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

#pragma mark - <UITextFieldDelegate>

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
//    // If the delegate can handle the method, call it
//    if ([self.delegate respondsToSelector:@selector(textEntryTableViewCellShouldReturn:)]) {
//        DLog(@"textFieldShouldReturn handled in delegate");
//        return [self.delegate textEntryTableViewCellShouldReturn:textField];
//        
//        // Otherwise handle it here, resign first responder and return true
//    } else {
    
//        DLog(@"textFieldShouldReturn handled in tableViewCell");
    
        //    DLog(@"textFieldShouldReturn delegate call");
        NSAssert(textField == self.textField, @"Error received unexpected delegate message from %@", textField);
        [self.textField resignFirstResponder];
        return true;
    
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ((self.delegate != nil) && ([self.delegate respondsToSelector:@selector(selectedTextFieldForIdentifier:)])) {
//        DLog(@"selectedTextField handled in delegate");
        [self.delegate selectedTextFieldForIdentifier:self.identifier];
    } else {
//        DLog(@"selectedTextField handled in cell");
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    
//    BOOL returnBool;
    
    if ([self.delegate respondsToSelector:@selector(textEntryDidChange:forIdentifier:)]) {
//        DLog(@"textEntryDidChange: forIdentifier handled in delegate");
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        [self.delegate textEntryDidChange:newString forIdentifier:self.identifier];
    } else {
//        DLog(@"textEntryDidChange: forIdentifier not handled in delegate");
    }
    
    
    // only when adding on the end of textfield && it's a space
    if (range.location == textField.text.length && [string isEqualToString:@" "]) {
        // ignore replacement string and add your own
        textField.text = [textField.text stringByAppendingString:@"\u00a0"];
        return false;
    }
    // for all other cases, proceed with replacement
    return true;
    
    
    //    if ([self.delegate respondsToSelector:@selector(textEntryTableViewCell:shouldChangeCharactersInRange:replacementString:)]) {
    //        DLog(@"textField: shouldChangeCharactersInRange handled in delegate");
    //        returnValue = [self.delegate textEntryTableViewCell:textField shouldChangeCharactersInRange:range replacementString:string];
    //    } else {
    //        DLog(@"textField: shouldChangeCharactersInRange handled in tableViewCell");
    //        returnValue = true;
    //    }
    //
    
    
    
}

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    BOOL returnValue = true;
//    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    
//    return returnValue;
//    
////    if ([self.delegate respondsToSelector:@selector(textEntryTableViewCell:shouldChangeCharactersInRange:replacementString:)]) {
////        DLog(@"textField: shouldChangeCharactersInRange handled in delegate");
////        returnValue = [self.delegate textEntryTableViewCell:textField shouldChangeCharactersInRange:range replacementString:string];
////    } else {
////        DLog(@"textField: shouldChangeCharactersInRange handled in tableViewCell");
////        returnValue = true;
////    }
////    
//    
//    
//    if ([self.delegate respondsToSelector:@selector(textEntryDidChange:forIdentifier:)]) {
//        DLog(@"textEntryDidChange: forIdentifier handled in delegate");
//        [self.delegate textEntryDidChange:newString forIdentifier:self.identifier];
//    } else {
//        DLog(@"textEntryDidChange: forIdentifier not handled in delegate");
//    }
//    
//    return returnValue;
//}
//

@end
