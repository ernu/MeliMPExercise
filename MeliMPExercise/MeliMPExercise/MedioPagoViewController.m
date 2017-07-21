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
#import "MedioPagoCell.h"
#import "PagarViewController.h"

#define unwindFromMedioPagoToPagar                @"unwindFromMedioPagoToPagar"

@interface MedioPagoViewController () {
    AnimatedLoadingView *loadingView;
    BOOL firstLoad;
    NSString *medioPagoReuseId;
    MedioPago *selectedMedioPago;
}

@property (strong, nonatomic) NSArray<MedioPago *> *medioPagoArray;

@end

@implementation MedioPagoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstLoad = false;
    
    loadingView = [[AnimatedLoadingView alloc] initWithFrame:self.view.frame bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] firstColor:[UIColor MELI_Blue] secondColor:[UIColor MELI_Yellow]];
    [self.view addSubview:loadingView];
    
    medioPagoReuseId = NSStringFromClass([MedioPagoCell class]);
    
    [_medioPagoTableView.layer setCornerRadius:5.0];
    _medioPagoTableView.delegate = self;
    _medioPagoTableView.dataSource = self;
    [_medioPagoTableView registerNib:[UINib nibWithNibName:medioPagoReuseId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:medioPagoReuseId];
    
    MedioPagoRequestObject *reqObject =  [[MedioPagoRequestObject alloc] init];
    ServiceManager *sm = [[ServiceManager alloc] init];
    sm.delegate = self;
    [sm callGETService:kBaseUrl request:reqObject];

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
            _medioPagoArray = [MedioPago dictArrayToModelArrayCreditCard:dictArray];
            [_medioPagoTableView reloadData];
        }
        
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

#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _medioPagoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MedioPagoCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MedioPago *medioPago = [_medioPagoArray objectAtIndex:indexPath.row];
    MedioPagoCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:medioPagoReuseId forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[MedioPagoCell alloc] init];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [cell setData:medioPago];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedMedioPago = [_medioPagoArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:unwindFromMedioPagoToPagar sender:self];
    
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:unwindFromMedioPagoToPagar]) {
        PagarViewController *vc = [segue destinationViewController];
        [vc setSelectedMedioPago:selectedMedioPago];
    }
}

@end
