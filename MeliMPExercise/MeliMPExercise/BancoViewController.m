//
//  BancoViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "BancoViewController.h"
#import "BancoRequestObject.h"
#import "Constants.h"
#import "AnimatedLoadingView.h"
#import "UIColor+MELI.h"
#import "Banco.h"
#import "CommonCell.h"
#import "PagarViewController.h"

#define unwindFromBancoToPagar                @"unwindFromBancoToPagar"

@interface BancoViewController () {
    AnimatedLoadingView *loadingView;
    BOOL firstLoad;
    NSString *bancoReuseId;
    Banco *selectedBanco;
}

@property (strong, nonatomic) NSArray<Banco *> *bancoArray;

@end

@implementation BancoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstLoad = false;
    
    loadingView = [[AnimatedLoadingView alloc] initWithFrame:self.view.frame bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] firstColor:[UIColor MELI_Blue] secondColor:[UIColor MELI_Yellow]];
    [self.view addSubview:loadingView];
    
    bancoReuseId = NSStringFromClass([CommonCell class]);
    
    [_noBancosView.layer setCornerRadius:5.0];
    [_bancoTableView.layer setCornerRadius:5.0];
    _bancoTableView.delegate = self;
    _bancoTableView.dataSource = self;
    [_bancoTableView registerNib:[UINib nibWithNibName:bancoReuseId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:bancoReuseId];
    
    BancoRequestObject *reqObject = [[BancoRequestObject alloc] initWithMedioPago:_selectedMedioPago];
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
    if ([uri isEqualToString:kUriBanco]) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *dictArray = (NSArray *)responseObject;
            _bancoArray = [Banco dictArrayToModelArray:dictArray];
            if (_bancoArray.count > 0) {
                [_bancoTableView reloadData];
            } else {
                _noBancosView.hidden = false;
            }
        }
        
    }
    
    [loadingView stop];
}

- (void)onResponseFailure:(NSError *)error uri:(NSString *)uri {
    
    if ([uri isEqualToString:kUriBanco]) {
        
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
    return _bancoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CommonCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Banco *banco = [_bancoArray objectAtIndex:indexPath.row];
    CommonCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:bancoReuseId forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[CommonCell alloc] init];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [cell setData:banco.name img:nil];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedBanco = [_bancoArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:unwindFromBancoToPagar sender:self];
    
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:unwindFromBancoToPagar]) {
        PagarViewController *vc = [segue destinationViewController];
        [vc setSelectedBanco:selectedBanco];
    }
}

@end
