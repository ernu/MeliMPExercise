//
//  MontoViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MontoViewController.h"
#import "UIColor+MELI.h"
#import "PagarViewController.h"

#define unwindFromMontoToPagar                @"unwindFromMontoToPagar"

@interface MontoViewController ()

@end

@implementation MontoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_confirmBtn setEnabled:false];
    
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
    [self performSegueWithIdentifier:unwindFromMontoToPagar sender:self];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *number = [textField.text stringByReplacingCharactersInRange:range withString:string];
    number = [number stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    NSArray  *arrayOfString = [number componentsSeparatedByString:@"."];
    if (([arrayOfString count] > 2) || (([arrayOfString count] == 2) && ([[arrayOfString objectAtIndex:1] length] > 2))) return NO;
    
    [_confirmBtn setEnabled:[number length] > 0];
    
    return YES;
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:unwindFromMontoToPagar]) {
        PagarViewController *vc = [segue destinationViewController];
        NSString *montoStr = [_montoTf.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        [vc setSelectedMonto:montoStr];
    }
}

@end
