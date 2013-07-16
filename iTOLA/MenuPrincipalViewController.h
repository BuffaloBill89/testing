//
//  MenuPrincipalViewController.h
//  iTOLA
//
//  Created by Isaac Gonzalvez on 24/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPrincipalViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *botonMiralin;
@property (strong, nonatomic) IBOutlet UIButton *botonBescanvis;
@property (strong, nonatomic) IBOutlet UIButton *botonUbicacions;
@property (strong, nonatomic) IBOutlet UIButton *botonTelefons;
@property (strong, nonatomic) IBOutlet UIButton *botonInterfons;
@property (strong, nonatomic) IBOutlet UIButton *botonRutes;
@property (strong, nonatomic) IBOutlet UIButton *botonZones;


- (IBAction)informacio;

- (IBAction)miralin;

@end
