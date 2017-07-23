//
//  MainViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MainViewController.h"

#define seguePagar                @"seguePagar"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pagarBtnTapped:(id)sender {
    [self performSegueWithIdentifier:seguePagar sender:self];
}

- (void)onDataConfirmed:(NSString *)monto medioPago:(MedioPago *)medioPago banco:(Banco *)banco cuota:(Cuota *)cuota {
    
    NSString *paymentInfo = [NSString stringWithFormat:NSLocalizedString(@"TXT_PAYMENT_INFO_DESCRIPTION", nil), monto, medioPago.name, banco.name, cuota.msg];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"TXT_PAYMENT_INFO", nil) message:paymentInfo preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"TXT_ACCEPT", nil) style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:seguePagar]) {
        PagarViewController *vc = [segue destinationViewController];
        [vc setDelegate:self];
    }
    
}

@end
