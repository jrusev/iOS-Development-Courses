//
//  StatusHistoryViewController.m
//  Matchismo
//
//  Created by Sanjib Ahmad on 12/1/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//

#import "StatusHistoryViewController.h"

@interface StatusHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusHistoryTextView;
@end

@implementation StatusHistoryViewController

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
    
    [self updateStatusHistoryTextView];
}

- (void)updateStatusHistoryTextView
{
    NSMutableAttributedString *statusHistoryText = [[NSMutableAttributedString alloc] init];
    for (NSAttributedString *status in self.statusHistory) {
        [statusHistoryText appendAttributedString:status];
        [statusHistoryText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    }
    self.statusHistoryTextView.attributedText = statusHistoryText;
}

@end
