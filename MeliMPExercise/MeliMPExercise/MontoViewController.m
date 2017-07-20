//
//  MontoViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MontoViewController.h"
#import "UIColor+MELI.h"

@interface MontoViewController ()

@end

@implementation MontoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_confirmBtn.layer setCornerRadius:5.0];
    [_confirmBtn setEnabled:false];
    [_confirmBtn setBackgroundColor:[UIColor MELI_LightGray]];
    
    _montoTf.delegate = self;
    [_montoTf becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeBtnTapped:(id)sender {
    [_montoTf resignFirstResponder];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)confirmBtnTapped:(id)sender {
    [_delegate onMontoConfirmed:_montoTf.text];
    [self closeBtnTapped:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *number = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSArray  *arrayOfString = [number componentsSeparatedByString:@"."];
    if (([arrayOfString count] > 2) || (([arrayOfString count] == 2) && ([[arrayOfString objectAtIndex:1] length] > 2))) return NO;
    
    if ([number length] > 0) {
        [_confirmBtn setEnabled:true];
        [_confirmBtn setBackgroundColor:[UIColor MELI_Blue]];
    } else {
        [_confirmBtn setEnabled:false];
        [_confirmBtn setBackgroundColor:[UIColor MELI_LightGray]];
    }
    
    return YES;
}

@end
