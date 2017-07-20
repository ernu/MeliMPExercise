//
//  PagarViewController.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "PagarViewController.h"

#define dataViewMonto               @"dataViewMonto"
#define dataViewMedioPago           @"dataViewMedioPago"
#define dataViewBanco               @"dataViewBanco"
#define dataViewCuotas              @"dataViewCuotas"

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
    
    [self initDatosViewContainer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDatosViewContainer {
    
    _montoDataView = [[DataView alloc] initWithData:@"Ingrese un monto" img:nil typeId:DataViewMonto];
    _medioPagoDataView = [[DataView alloc] initWithData:@"Seleccione un medio de pago" img:nil typeId:DataViewMedioPago];
    _bancoDataView = [[DataView alloc] initWithData:@"Ingrese un banco" img:nil typeId:DataViewBanco];
    _cuotasDataView = [[DataView alloc] initWithData:@"Ingrese la cantidad de cuotas" img:nil typeId:DataViewCuotas];
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

#pragma mark - DataViewDelegate

- (void)onDataViewTapped:(int)typeId {
    
    switch(typeId)
    {
        case DataViewMonto:
            NSLog(@"MontoTapped");
            
            break;
        case DataViewMedioPago:
            NSLog(@"MedioPagoTapped");
            
            break;
        case DataViewBanco:
            NSLog(@"BancoTapped");
            
            break;
        case DataViewCuotas:
            NSLog(@"CuotasTapped");
            
            break;
        default:
            
            break;
    }
    
}

@end
