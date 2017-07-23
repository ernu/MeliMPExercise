//
//  PagarViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "PagarViewController.h"
#import "UIColor+MELI.h"

#define segueMonto                @"segueMonto"
#define segueMedioPago            @"segueMedioPago"
#define segueBanco                @"segueBanco"
#define segueCuota                @"segueCuota"

@interface PagarViewController()

@property (strong, nonatomic) DataView *montoDataView;
@property (strong, nonatomic) DataView *medioPagoDataView;
@property (strong, nonatomic) DataView *bancoDataView;
@property (strong, nonatomic) DataView *cuotasDataView;

typedef enum {
    DataViewMonto,
    DataViewMedioPago,
    DataViewBanco,
    DataViewCuotas
} DataViewType;

@end

@implementation PagarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectedMonto = 0;
    _selectedMedioPago = nil;
    
    [_confirmBtn.layer setCornerRadius:5.0];
    [_confirmBtn setEnabled:false];
    [_confirmBtn setBackgroundColor:[UIColor MELI_LightGray]];
    
    [self initDatosViewContainer];
    [self checkFilledData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDatosViewContainer {
    
    _montoDataView = [[DataView alloc] initWithData:NSLocalizedString(@"TXT_INGRESE_MONTO", nil) img:nil typeId:DataViewMonto];
    _medioPagoDataView = [[DataView alloc] initWithData:NSLocalizedString(@"TXT_SELECCIONE_MEDIO_PAGO", nil) img:nil typeId:DataViewMedioPago];
    _bancoDataView = [[DataView alloc] initWithData:NSLocalizedString(@"TXT_SELECCIONE_BANCO", nil) img:nil typeId:DataViewBanco];
    _cuotasDataView = [[DataView alloc] initWithData:NSLocalizedString(@"TXT_SELECCIONE_CUOTAS", nil) img:nil typeId:DataViewCuotas];
    _montoDataView.delegate = self;
    _medioPagoDataView.delegate = self;
    _bancoDataView.delegate = self;
    _cuotasDataView.delegate = self;
    
    NSArray *dataViews = [[NSArray alloc] initWithObjects:_montoDataView, _medioPagoDataView, _bancoDataView, _cuotasDataView, nil];
    DataView *previousDV = nil;
    int index = 0;
    _datosHeightConstraint.priority = 1;
    
    for (DataView *dataView in dataViews) {
        
        NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_datosViewContainer attribute:NSLayoutAttributeLeading multiplier:1.0 constant:8];
        NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_datosViewContainer attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-8];
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[DataView viewHeight]];
        NSLayoutConstraint *topConstraint;
        NSLayoutConstraint *bottomConstraint;
        
        NSMutableArray *constraintToAdd = [[NSMutableArray alloc] initWithObjects:leadingConstraint, trailingConstraint, heightConstraint, nil];
        
        if (index == 0) {
            
            topConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_datosViewContainer attribute:NSLayoutAttributeTop multiplier:1.0 constant:8];
            
        } else {
            
            topConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:previousDV attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8];
            if (index == dataViews.count - 1) {
                bottomConstraint = [NSLayoutConstraint constraintWithItem:dataView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_datosViewContainer attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
                [constraintToAdd addObject:bottomConstraint];
            }
            
        }
        
        [constraintToAdd addObject:topConstraint];
        
        [_datosViewContainer addSubview:dataView];
        [self.view addConstraints:constraintToAdd];
        
        previousDV = dataView;
        index++;
    }
    
}

- (BOOL)checkFilledData {
    
    BOOL allFilled = true;
    [_bancoDataView setTapGestureActive:true];
    [_cuotasDataView setTapGestureActive:true];
    
    if (!_selectedMedioPago) {
        allFilled = false;
        [_bancoDataView setTapGestureActive:false];
        _bancoDataView.datosLbl.text = NSLocalizedString(@"TXT_SELECCIONE_BANCO", nil);
    }
    if (!_selectedMonto || [_selectedMonto intValue] == 0 || !_selectedBanco || !_selectedMedioPago) {
        allFilled = false;
        [_cuotasDataView setTapGestureActive:false];
        _bancoDataView.datosLbl.text = NSLocalizedString(@"TXT_SELECCIONE_BANCO", nil);
        _cuotasDataView.datosLbl.text = NSLocalizedString(@"TXT_SELECCIONE_CUOTAS", nil);
    }
    if (!_selectedCuota) {
        allFilled = false;
        _cuotasDataView.datosLbl.text = NSLocalizedString(@"TXT_SELECCIONE_CUOTAS", nil);
    }
    
    if (allFilled) {
        [_confirmBtn setEnabled:true];
        [_confirmBtn setBackgroundColor:[UIColor MELI_Blue]];
    } else {
        [_confirmBtn setEnabled:false];
        [_confirmBtn setBackgroundColor:[UIColor MELI_LightGray]];
    }
    
    return allFilled;
}

- (IBAction)confirmBtnTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    [_delegate onDataConfirmed:_selectedMonto medioPago:_selectedMedioPago banco:_selectedBanco cuota:_selectedCuota];
}

#pragma mark - DataViewDelegate

- (void)onDataViewTapped:(int)typeId {
    
    switch(typeId)
    {
        case DataViewMonto:
            NSLog(@"MontoTapped");
            [self performSegueWithIdentifier:segueMonto sender:self];
            
            break;
        case DataViewMedioPago:
            NSLog(@"MedioPagoTapped");
            [self performSegueWithIdentifier:segueMedioPago sender:self];
            
            break;
        case DataViewBanco:
            NSLog(@"BancoTapped");
            [self performSegueWithIdentifier:segueBanco sender:self];
            
            break;
        case DataViewCuotas:
            NSLog(@"CuotasTapped");
            [self performSegueWithIdentifier:segueCuota sender:self];
            
            break;
        default:
            NSLog(@"OtherTapped");
            
            break;
    }
    
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:segueBanco]) {
        BancoViewController *vc = [segue destinationViewController];
        [vc setSelectedMedioPago:_selectedMedioPago];
    } else if ([segue.identifier isEqualToString:segueCuota]) {
        CuotaViewController *vc = [segue destinationViewController];
        [vc setSelectedMedioPago:_selectedMedioPago];
        [vc setSelectedBanco:_selectedBanco];
        [vc setSelectedMonto:_selectedMonto];
    }
    
}

- (IBAction)unwindFromMontoToPagar:(UIStoryboardSegue *)unwindSegue
{
    _montoDataView.datosLbl.text = [NSString stringWithFormat:@"$ %@", _selectedMonto];
    _selectedCuota = nil;
    [self checkFilledData];
}

- (IBAction)unwindFromMedioPagoToPagar:(UIStoryboardSegue *)unwindSegue
{
    _medioPagoDataView.datosLbl.text = _selectedMedioPago.name;
    [_medioPagoDataView setImgWithUrl:_selectedMedioPago.thumbnail];
    _selectedBanco = nil;
    _selectedCuota = nil;
    [self checkFilledData];
    
}

- (IBAction)unwindFromBancoToPagar:(UIStoryboardSegue *)unwindSegue
{
    _bancoDataView.datosLbl.text = _selectedBanco.name;
    _selectedCuota = nil;
    [self checkFilledData];
    
}

- (IBAction)unwindFromCuotaToPagar:(UIStoryboardSegue *)unwindSegue
{
    _cuotasDataView.datosLbl.text = _selectedCuota.msg;
    [self checkFilledData];
    
}

@end
