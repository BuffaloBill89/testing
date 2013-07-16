//
//  BescanvisViewController.m
//  iTOLA
//
//  Created by Isaac Gonzalvez on 24/04/13.
//  Copyright (c) 2013 Isaac Gonzalvez. All rights reserved.
//

#import "BescanvisViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface BescanvisViewController ()

@end

@implementation BescanvisViewController
@synthesize datePicker, fechaBescanvi, infoBescanvi;

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
    NSDate *now = [NSDate date];
    [datePicker setDate:now animated:NO];
    fechaBescanvi.hidden = YES;
    fechaBescanvi.text = nil;
    fechaBescanvi.layer.cornerRadius = 8;
    infoBescanvi.hidden = NO;
    infoBescanvi.text = @"Selecciona día i targeta";
    infoBescanvi.layer.cornerRadius = 8;
}

- (void)viewDidAppear:(BOOL)animated {
    fechaBescanvi.text = nil;
    infoBescanvi.text = @"Selecciona día i targeta";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)botont12rosaplastic{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *selected = [datePicker date];
    selected = [selected dateByAddingTimeInterval:60*60*24*44];
    
    fechaBescanvi.text = [dateFormatter stringFromDate:selected];
    infoBescanvi.text = @"El titular rebra el titol definitiu al seu domicili";
    infoBescanvi.hidden = NO;
    fechaBescanvi.hidden = NO;
    
}

-(IBAction)botont50307030{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *selected = [datePicker date];
    selected = [selected dateByAddingTimeInterval:60*60*24*29];
    
    fechaBescanvi.text = [dateFormatter stringFromDate:selected];
    infoBescanvi.text = nil;
    infoBescanvi.hidden = YES;
    fechaBescanvi.hidden = NO;

}

-(IBAction)botontmes{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *selected = [datePicker date];
    selected = [selected dateByAddingTimeInterval:60*60*24*29];
    
    fechaBescanvi.text = [dateFormatter stringFromDate:selected];
    infoBescanvi.text = @"Titol d'una zona, la primera validació sera 00, sino, no fer bescanvi";
    infoBescanvi.hidden = NO;
    fechaBescanvi.hidden = NO;

    
}

-(IBAction)botonrosacartro{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *selected = [datePicker date];
    selected = [selected dateByAddingTimeInterval:60*60*24*44];
    
    fechaBescanvi.text = [dateFormatter stringFromDate:selected];
    infoBescanvi.text = @"La persona afectada es dirigirá als punts TMB on rebá un titol nou";
    infoBescanvi.hidden = NO;
    fechaBescanvi.hidden = NO;

}

-(IBAction)botontjovetrimestre{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *selected = [datePicker date];
    selected = [selected dateByAddingTimeInterval:60*60*24*89];
    
    fechaBescanvi.text = [dateFormatter stringFromDate:selected];
    infoBescanvi.text = @"Titol d'una zona, la primera validació sera 00, sino, no fer bescanvi";
    infoBescanvi.hidden = NO;
    fechaBescanvi.hidden = NO;

}



@end
