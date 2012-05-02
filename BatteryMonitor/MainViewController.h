//
//  MainViewController.h
//  BatteryMonitor
//
//  Created by Garrett Koller on 5/1/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLevel;

- (IBAction)showInfo:(id)sender;

@end
