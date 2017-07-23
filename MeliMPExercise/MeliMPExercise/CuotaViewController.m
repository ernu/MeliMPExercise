//
//  CuotaViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "CuotaViewController.h"
#import "CuotaRequestObject.h"
#import "Constants.h"
#import "AnimatedLoadingView.h"
#import "UIColor+MELI.h"
#import "Cuota.h"
#import "CommonCell.h"
#import "PagarViewController.h"

#define unwindFromCuotaToPagar                @"unwindFromCuotaToPagar"

@interface CuotaViewController () {
    AnimatedLoadingView *loadingView;
    BOOL firstLoad;
    NSString *cuotaReuseId;
    Cuota *selectedCuota;
}

@property (strong, nonatomic) NSArray<Cuota *> *cuotaArray;

@end

@implementation CuotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstLoad = false;
    
    loadingView = [[AnimatedLoadingView alloc] initWithFrame:self.view.frame bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] firstColor:[UIColor MELI_Blue] secondColor:[UIColor MELI_Yellow]];
    [self.view addSubview:loadingView];
    
    cuotaReuseId = NSStringFromClass([CommonCell class]);
    
    [_cuotaTableView.layer setCornerRadius:5.0];
    _cuotaTableView.delegate = self;
    _cuotaTableView.dataSource = self;
    [_cuotaTableView registerNib:[UINib nibWithNibName:cuotaReuseId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cuotaReuseId];
    
    CuotaRequestObject *reqObject = [[CuotaRequestObject alloc] initWithMedioPago:_selectedMedioPago banco:_selectedBanco monto:_selectedMonto];
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
    if ([uri isEqualToString:kUriCuota]) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *dictArray = (NSArray *)responseObject;
            _cuotaArray = [Cuota dictArrayToModelArray:dictArray];
            [_cuotaTableView reloadData];
        }
        
    }
    
    [loadingView stop];
}

- (void)onResponseFailure:(NSError *)error uri:(NSString *)uri {
    
    if ([uri isEqualToString:kUriCuota]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"TXT_ERROR", nil) message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"TXT_ACCEPT", nil) style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [loadingView stop];
}

#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cuotaArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CommonCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Cuota *cuota = [_cuotaArray objectAtIndex:indexPath.row];
    CommonCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cuotaReuseId forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[CommonCell alloc] init];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [cell setData:cuota.msg img:nil];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedCuota = [_cuotaArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:unwindFromCuotaToPagar sender:self];
    
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:unwindFromCuotaToPagar]) {
        PagarViewController *vc = [segue destinationViewController];
        [vc setSelectedCuota:selectedCuota];
    }
}

@end
