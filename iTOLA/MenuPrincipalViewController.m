//
//  MenuPrincipalViewController.m
//  iTOLA
//
//  Created by Isaac Gonzalvez on 24/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import "MenuPrincipalViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface MenuPrincipalViewController ()

@end

@implementation MenuPrincipalViewController
@synthesize botonMiralin, botonBescanvis, botonUbicacions, botonInterfons, botonTelefons, botonRutes, botonZones;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    botonMiralin.layer.cornerRadius = 8;
    botonBescanvis.layer.cornerRadius = 8;
    botonUbicacions.layer.cornerRadius = 8;
    botonInterfons.layer.cornerRadius = 8;
    botonTelefons.layer.cornerRadius = 8;
    botonRutes.layer.cornerRadius = 8;
    botonZones.layer.cornerRadius = 8;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)informacio {
    
    UIAlertView *alertinformacio = [[UIAlertView alloc]
                         initWithTitle:@"Informació"
                         message:@"Versió d'iPhone de la app TOLADroid adaptada per Isaac Gonzálvez. Idea original de: Joaquin Sabariego, Juanma Gutiérrez i Toni Fernadez"
                         delegate:nil
                         cancelButtonTitle:@"Tornar"
                         otherButtonTitles:nil];
    [alertinformacio show];

    
    
}

- (IBAction)miralin {
    
    UIAlertView *alertmiralin = [[UIAlertView alloc] initWithTitle:@"Proximament" message:@"L'eina miralin encara esta en proces de desenvolupament i no es troba disponible. Disculpeu les molesties" delegate:nil cancelButtonTitle:@"Tindre paciencia!" otherButtonTitles: nil];
    [alertmiralin show];
}
@end
