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
    
    [_pagarBtn.layer setCornerRadius:5.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pagarBtnTapped:(id)sender {
    [self performSegueWithIdentifier:seguePagar sender:self];
}

@end
