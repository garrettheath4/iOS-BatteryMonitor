//
//  MainViewController.m
//  BatteryMonitor
//
//  Created by Garrett Koller on 5/1/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize levelLabel;
@synthesize stateLevel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLevelLabel:nil];
    [self setStateLevel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIDevice *device = [UIDevice currentDevice];
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    device.batteryMonitoringEnabled = appDelegate.monitorBattery;
    
    if (device.batteryMonitoringEnabled) {
        // Get the name of the notifications from the AppDelegate
        // levelNotificationName should be @"UIDeviceBatteryLevelDidChangeNotification"
        // stateNotificationName should be @"UIDeviceBatteryStateDidChangeNotification"
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:[appDelegate levelNotificationName] object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:[appDelegate stateNotificationName] object:nil];
    } else {
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:[appDelegate levelNotificationName] object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:[appDelegate stateNotificationName] object:nil];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

@end
