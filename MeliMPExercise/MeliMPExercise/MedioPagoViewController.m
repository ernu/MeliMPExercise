//
//  MedioPagoViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MedioPagoViewController.h"
#import "ServiceManager.h"
#import "MedioPagoRequestObject.h"
#import "Constants.h"
#import "AnimatedLoadingView.h"
#import "UIColor+MELI.h"
#import "MedioPago.h"

@interface MedioPagoViewController () {
    AnimatedLoadingView *loadingView;
    BOOL firstLoad;
}

@property (strong, nonatomic) NSArray<MedioPago *> *medioPagoArray;

@end

@implementation MedioPagoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstLoad = false;
    
    loadingView = [[AnimatedLoadingView alloc] initWithFrame:self.view.frame bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] firstColor:[UIColor MELI_Blue] secondColor:[UIColor MELI_Yellow]];
    [self.view addSubview:loadingView];
    
    MedioPagoRequestObject *reqObject =  [[MedioPagoRequestObject alloc] init];
    [ServiceManager sharedInstance].delegate = self;
    [[ServiceManager sharedInstance] callGETService:kBaseUrl request:reqObject];

}

- (void)viewWillAppear:(BOOL)animated {
    if (!firstLoad) {
        [loadingView start];
        firstLoad = true;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeBtnTapped:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ServiceManagerDelegate

- (void)onResponseSuccess:(id)responseObject uri:(NSString *)uri {
    if ([uri isEqualToString:kUriMedioPago]) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *dictArray = (NSArray *)responseObject;
            _medioPagoArray = [MedioPago dictArrayToModelArray:dictArray];
        }
        
        //TODO: popular tableview
    }
    
    [loadingView stop];
}

- (void)onResponseFailure:(NSError *)error uri:(NSString *)uri {
    
    if ([uri isEqualToString:kUriMedioPago]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"TXT_ERROR", nil) message:error.description preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"TXT_ACCEPT", nil) style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [loadingView stop];
}

@end
