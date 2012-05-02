//
//  FlipsideViewController.m
//  BatteryMonitor
//
//  Created by Garrett Koller on 5/1/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "FlipsideViewController.h"
#import "AppDelegate.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

@synthesize delegate = _delegate;
@synthesize toggleSwitch = _toggleSwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Preferences";
    AppDelegate *appDeligate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.toggleSwitch.on = appDeligate.monitorBattery;
}

- (void)viewDidUnload
{
    [self setToggleSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.monitorBattery = self.toggleSwitch.on;
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
